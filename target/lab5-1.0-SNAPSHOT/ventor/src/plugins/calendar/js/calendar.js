import moment from 'moment';
import { getUID, element, typeCheckConfig, getjQuery, onDOMContentLoaded } from './mdb/util/index';
import Data from './mdb/dom/data';
import EventHandler from './mdb/dom/event-handler';
import Manipulator from './mdb/dom/manipulator';
import SelectorEngine from './mdb/dom/selector-engine';

import Tooltip from './utils/tooltips';
import { addModalTemplate, editModalTemplate } from './utils/templates';
import { eventType, eventTimePeriod } from './utils/utils';

/**
 * ------------------------------------------------------------------------
 * Constants
 * ------------------------------------------------------------------------
 */

const NAME = 'calendar';
const DATA_KEY = 'mdb.calendar';
const CLASSNAME_CALENDAR = 'calendar';
const CLASSNAME_DAY_FIELD = 'day-field';
const CLASSNAME_CALENDAR_TOOLS = 'calendar-tools';
const CLASSNAME_CALENDAR_HEADING = 'calendar-heading';
const CLASSNAME_ALL_DAY_ROW = 'long-event-row';
const CLASSNAME_EVENTS_WRAPPER = 'events-wrapper';
const CLASSNAME_ACTIVE = 'active';

const SELECTOR_ACTIVE_CELL = `td.${CLASSNAME_ACTIVE}`;
const SELECTOR_CALENDAR_SUMMARY_INPUT = '.calendar-summary-input';
const SELECTOR_CALENDAR_LONG_EVENTS_CHECKBOX = '.calendar-long-events-checkbox';

const OPTIONS_TYPE = {
  weekdays: '(array|string)',
  months: '(array|string)',
  monthsShort: '(array|string)',
  mondayFirst: 'boolean',
  defaultView: 'string',
  twelveHour: 'boolean',
  defaultDate: '(object|string)',
  readonly: 'boolean',
  todayCaption: 'string',
  monthCaption: 'string',
  weekCaption: 'string',
  listCaption: 'string',
  allDayCaption: 'string',
  noEventsCaption: 'string',
  summaryCaption: 'string',
  descriptionCaption: 'string',
  startCaption: 'string',
  endCaption: 'string',
  addCaption: 'string',
  deleteCaption: 'string',
  editCaption: 'string',
  closeCaption: 'string',
  addEventModalCaption: 'string',
  editEventModalCaption: 'string',
  events: 'array',
};

const DEFAULT_OPTIONS = {
  weekdays: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
  months: [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ],
  monthsShort: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
  mondayFirst: false,
  defaultView: 'month',
  twelveHour: false,
  defaultDate: moment().format('DD/MM/YYYY'),
  readonly: false,
  todayCaption: 'today',
  monthCaption: 'month',
  weekCaption: 'week',
  allDayCaption: 'All day event',
  listCaption: 'list',
  noEventsCaption: 'No events',
  summaryCaption: 'Summary',
  descriptionCaption: 'Description',
  startCaption: 'Start',
  endCaption: 'End',
  addCaption: 'Add',
  deleteCaption: 'Remove',
  editCaption: 'Edit',
  closeCaption: 'Close',
  addEventModalCaption: 'Add an event',
  editEventModalCaption: 'Edit an event',
  events: [],
};

/**
 * ------------------------------------------------------------------------
 * Class Definition
 * ------------------------------------------------------------------------
 */

class Calendar {
  constructor(element, options = {}) {
    this._element = element;
    this._options = options;

    this.formats = {
      date: 'DD/MM/YYYY',
      dateTime: this.options.twelveHour ? 'DD/MM/YYYY hh:mm A' : 'DD/MM/YYYY HH:mm',
      time: this.options.twelveHour ? 'hh:mm A' : 'HH:mm',
    };
    this.view = this.options.defaultView;
    this.weekdays = [...this.options.weekdays];
    this.activeMoment = moment(this.options.defaultDate, this.formats.date);
    this.events = this._formatEvents();
    this._newEvent = {};
    this._activeEvent = {};

    this._addModalId = getUID('addModal');
    this._editModalId = getUID('editModal');
    this._table = null;
    this._tHead = null;
    this._tBody = null;
    this._addEventModal = null;
    this._editEventModal = null;
    this._tools = null;
    this._arrowLeft = null;
    this._arrowRight = null;
    this._pickedStartDate = null;

    this._addEventModalInstance = null;
    this._editEventModalInstance = null;
    this._inputInstances = [];
    this._tooltips = [];

    if (this._element) {
      Data.setData(element, DATA_KEY, this);
    }

    this.init();
  }

  // Getters
  get options() {
    const config = {
      ...DEFAULT_OPTIONS,
      ...Manipulator.getDataAttributes(this._element),
      ...this._options,
    };

    typeCheckConfig(NAME, config, OPTIONS_TYPE);

    if (typeof config.weekdays === 'string') config.weekdays = config.weekdays.split(', ');
    if (typeof config.months === 'string') config.months = config.months.split(', ');
    if (typeof config.monthsShort === 'string') config.monthsShort = config.monthsShort.split(', ');

    return config;
  }

  get activeMomentCopy() {
    return moment(this.activeMoment);
  }

  get activeEventIndex() {
    return this._activeEvent.key - 1;
  }

  // Public
  init() {
    this._appendTemplate();
    this._sortEvents();
    this._addEventsKeys();
    this._setEvents();
    this._orderEvents();
    this._setLongEventCaptions();
    this._addListeners();
    this._initTooltips();

    if (!this.options.readonly) {
      this._createAddEventModal();
      this._createEditEventModal();
    }
  }

  prev() {
    switch (this.view) {
      case 'month':
        this.activeMoment.startOf('month').subtract(1, 'month');
        break;
      case 'week':
      case 'list':
        this.activeMoment.subtract(1, 'week');
        this._setTHeadCaptions();
        break;
      default:
        return;
    }

    this._refreshTable();
    this._triggerEvent('prev');
  }

  next() {
    switch (this.view) {
      case 'month':
        this.activeMoment.startOf('month').add(1, 'month');
        this._setTBody();
        break;
      case 'week':
      case 'list':
        this.activeMoment.add(1, 'week');
        this._setTHeadCaptions();
        break;
      default:
        return;
    }

    this._refreshTable();
    this._triggerEvent('next');
  }

  today() {
    this.activeMoment = moment();
    this._setHeading();

    switch (this.view) {
      case 'month':
        this._setTBody();
        break;
      case 'week':
      case 'list':
        this._setTHeadCaptions();
        break;
      default:
        return;
    }

    this._refreshTable();
    this._triggerEvent('today');
  }

  changeView(target) {
    this.view = target;
    this._setTHeadCaptions();
    this._setHeading();
    this._refreshTable();
    this._triggerEvent('viewChange');
  }

  refresh() {
    this._clearEvents();
    this._sortEvents();
    this._addEventsKeys();
    this._setTBody();
    this._setEvents();
    this._orderEvents();
    this._setLongEventCaptions();
    this._initTooltips();
    this._triggerEvent('update');
  }

  addEvents(events) {
    this.events = this._formatEvents([...this.events, ...events]);
    this.refresh();
  }

  removeEvents() {
    this.events = [];
    this.refresh();
  }

  dispose() {
    this.removeEvents();
    this._removeListeners();
    this._disposeModals();

    Data.removeData(this._element, DATA_KEY);
    this._element.innerHTML = null;
  }

  // Private
  _formatEvents(events = this.options.events) {
    return events.map((event) => {
      event = { ...event };
      event.created = event.created && moment(event.created, this.formats.dateTime);
      event.start.date = event.start.date && moment(event.start.date, this.formats.date);
      event.start.dateTime = event.start.dateTime
        ? moment(event.start.dateTime, this.formats.dateTime)
        : moment(event.start.date, this.formats.date);
      event.end.date = event.end.date && moment(event.end.date, this.formats.date);
      event.end.dateTime = event.end.dateTime
        ? moment(event.end.dateTime, this.formats.dateTime)
        : moment(event.end.date, this.formats.date);
      event.color = event.color || {};
      return event;
    });
  }

  _appendTemplate() {
    this._appendTools();
    this._appendTable();
    if (this.options.mondayFirst) {
      this.weekdays.push(this.weekdays.shift());
    }
    this._setTHeadCaptions();
    this._setTBody();
  }

  _appendTable() {
    this._table = element('table');
    this._element.append(this._table);

    this._tHead = element('thead');
    this._table.append(this._tHead);

    this._tBody = element('tbody');
    this._table.append(this._tBody);

    const tr = element('tr');
    this._tHead.append(tr);
  }

  _appendTools() {
    this._tools = element('div');
    const leftTools = element('div');
    const rightTools = element('div');
    this._arrowLeft = element('button');
    this._arrowRight = element('button');
    this._todayBtn = element('button');
    this._heading = element('span');
    this._monthBtn = element('button');
    this._weekBtn = element('button');
    this._listBtn = element('button');

    Manipulator.addClass(this._tools, CLASSNAME_CALENDAR_TOOLS);
    Manipulator.addClass(this._heading, CLASSNAME_CALENDAR_HEADING);
    Manipulator.addClass(leftTools, 'btn-group');
    Manipulator.addClass(leftTools, 'btn-group-sm');
    Manipulator.addClass(leftTools, 'shadow-0');
    Manipulator.addClass(rightTools, 'btn-group');
    Manipulator.addClass(rightTools, 'btn-group-sm');
    Manipulator.addClass(rightTools, 'shadow-0');
    [
      this._arrowLeft,
      this._arrowRight,
      this._todayBtn,
      this._monthBtn,
      this._weekBtn,
      this._listBtn,
    ].forEach((btn) => {
      Manipulator.setDataAttribute(btn, 'ripple-color', 'dark');
    });

    this._arrowLeft.innerHTML = '<i class="fas fa-chevron-left"></i>';
    this._arrowRight.innerHTML = '<i class="fas fa-chevron-right"></i>';
    this._todayBtn.innerHTML = this.options.todayCaption;
    this._monthBtn.innerHTML = this.options.monthCaption;
    this._weekBtn.innerHTML = this.options.weekCaption;
    this._listBtn.innerHTML = this.options.listCaption;

    ['btn', 'btn-outline-primary'].forEach((className) => {
      Manipulator.addClass(this._arrowLeft, className);
      Manipulator.addClass(this._arrowRight, className);
      Manipulator.addClass(this._todayBtn, className);
      Manipulator.addClass(this._monthBtn, className);
      Manipulator.addClass(this._weekBtn, className);
      Manipulator.addClass(this._listBtn, className);
    });

    this._setHeading();

    leftTools.append(this._arrowLeft);
    leftTools.append(this._arrowRight);
    leftTools.append(this._todayBtn);
    rightTools.append(this._monthBtn);
    rightTools.append(this._weekBtn);
    rightTools.append(this._listBtn);
    this._tools.append(leftTools);
    this._tools.append(this._heading);
    this._tools.append(rightTools);
    this._element.append(this._tools);
  }

  _setTHeadCaptions() {
    const headTr = SelectorEngine.findOne('tr', this._tHead);
    headTr.innerHTML = '';

    if (this.view === 'month') {
      this.weekdays.forEach((day) => {
        const th = element('th');
        th.innerHTML = day;
        headTr.append(th);
      });
    } else if (this.view === 'week') {
      const th = element('th');
      headTr.append(th);

      for (let i = 0; i < 7; i++) {
        const th = element('th');

        if (this.options.mondayFirst) {
          th.innerHTML = `${this.weekdays[i]} ${this.activeMomentCopy
            .startOf('week')
            .add(i + 1, 'day')
            .format('DD/MM')}`;
        } else {
          th.innerHTML = `${this.weekdays[i]} ${this.activeMomentCopy
            .startOf('week')
            .add(i, 'day')
            .format('DD/MM')}`;
        }

        headTr.append(th);
      }
    }
  }

  _setTBody() {
    this._clearTBody();
    Manipulator.addClass(this._table, this.view);

    switch (this.view) {
      case 'month':
        this._appendWeekRows();
        this._appendPrevMonthDays();
        this._appendCurrentMonthDays();
        this._appendNextMonthDays();
        break;
      case 'week':
        this._appendLongEventSection();
        this._appendHoursSection();
        break;
      default:
        return;
    }
  }

  _appendWeekRows() {
    for (let i = 0; i < 6; i++) {
      const tr = element('tr');
      this._tBody.append(tr);
    }
  }

  _appendPrevMonthDays() {
    const firstDayOfActiveMonth = this.activeMomentCopy.startOf('month').day();
    const prevMonthDays = this._getArrayFromNumber(
      this.activeMomentCopy.subtract(1, 'months').daysInMonth()
    );

    let splicedPrevMonthDays;
    if (this.options.mondayFirst) {
      if (firstDayOfActiveMonth === 0) {
        splicedPrevMonthDays = prevMonthDays.reverse().splice(0, 6).reverse();
      } else {
        splicedPrevMonthDays = prevMonthDays
          .reverse()
          .splice(0, firstDayOfActiveMonth - 1)
          .reverse();
      }
    } else {
      splicedPrevMonthDays = prevMonthDays.reverse().splice(0, firstDayOfActiveMonth).reverse();
    }

    splicedPrevMonthDays.forEach((day) => {
      this._appendPrevMonthDayFields(day);
    });
  }

  _appendPrevMonthDayFields(day) {
    const eventsWrapper = element('div');
    const td = element('td');
    const dayField = element('div');

    Manipulator.addClass(eventsWrapper, CLASSNAME_EVENTS_WRAPPER);
    Manipulator.addClass(td, 'disabled');
    Manipulator.addClass(dayField, CLASSNAME_DAY_FIELD);

    td.append(dayField);
    td.append(eventsWrapper);

    const date = `${day + 1}/${
      this.activeMomentCopy.startOf('month').subtract(1, 'month').month() + 1
    }/${this.activeMomentCopy.startOf('month').subtract(1, 'month').year()}`;
    td.dataset.date = date;

    dayField.innerHTML = day + 1;
    SelectorEngine.findOne('tr', this._tBody).append(td);

    if (!this.options.readonly) {
      this._addDayFieldListeners(td, date);
    }
  }

  _addDayFieldListeners(element, date) {
    EventHandler.on(element, 'mousedown', () => this._setStartDate(date));
    EventHandler.on(element, 'mouseenter', () => this._highlightLongEventField(date));
    EventHandler.on(element, 'mouseup', (e) => this._toggleAddEventModal(e, date));
    EventHandler.on(element, 'dragenter', (e) => this._handleDragEnter(e));
    EventHandler.on(element, 'dragover', (e) => this._handleDragOver(e));
    EventHandler.on(element, 'dragleave', (e) => this._handleDragLeave(e));
    EventHandler.on(element, 'drop', (e) => this._handleDrop(e, date));
  }

  _setStartDate(date) {
    this._pickedStartDate = date;
  }

  _highlightLongEventField(date) {
    if (!this._pickedStartDate) return;

    SelectorEngine.find('td', this._tBody).forEach((td) => {
      const startDate = moment(this._pickedStartDate, this.formats.dateTime);
      const selectionDate = moment(date, this.formats.dateTime);
      const tdDate = moment(td.dataset.dateTime || td.dataset.date, this.formats.dateTime);

      if (
        (tdDate.isBefore(selectionDate) && tdDate.isAfter(startDate)) ||
        (tdDate.isAfter(selectionDate) && tdDate.isBefore(startDate))
      ) {
        Manipulator.addClass(td, CLASSNAME_ACTIVE);
      } else {
        Manipulator.removeClass(td, CLASSNAME_ACTIVE);
      }
    });
  }

  _clearHighlight() {
    SelectorEngine.find(SELECTOR_ACTIVE_CELL, this._tBody).forEach((td) => {
      Manipulator.removeClass(td, CLASSNAME_ACTIVE);
    });
  }

  _toggleAddEventModal(e, date) {
    if (e.which === 3) {
      return;
    }
    this._newEvent = {};

    const start = {};
    const end = {};

    start.date = moment
      .min([moment(this._pickedStartDate, this.formats.date), moment(date, this.formats.date)])
      .startOf('day');
    end.date = moment
      .max([moment(this._pickedStartDate, this.formats.date), moment(date, this.formats.date)])
      .startOf('day');

    start.dateTime = moment.min([
      moment(this._pickedStartDate, this.formats.dateTime),
      moment(date, this.formats.dateTime),
    ]);
    end.dateTime = moment.max([
      moment(this._pickedStartDate, this.formats.dateTime),
      moment(date, this.formats.dateTime),
    ]);

    if (start.dateTime.format('hh:mm A') !== '12:00 AM') {
      end.dateTime.add(1, 'hour');
    }

    this._setNewEvent(start, end);
    this._updateAddEventModalContent();
    if (!this._addEventModalInstance) {
      this._addEventModalInstance = new mdb.Modal(this._addEventModal);
    }
    this._addEventModalInstance.show();
    this._initInputs();
    this._initPickers();
    this._addInputsListeners();
    this._clearSelection();

    // wait for modal animation end
    setTimeout(() => {
      const summaryInput = SelectorEngine.findOne(
        SELECTOR_CALENDAR_SUMMARY_INPUT,
        this._addEventModal
      );
      summaryInput.focus();
    }, 500);
  }

  _setNewEvent(start, end) {
    this._newEvent = {
      summary: '',
      description: '',
      start: {
        date: start.date,
        dateTime: start.dateTime,
      },
      end: {
        date: end.date,
        dateTime: end.dateTime,
      },
      color: {
        background: '#1266f1',
        foreground: 'white',
      },
    };
  }

  _clearSelection() {
    if (window.getSelection) {
      if (window.getSelection().empty) {
        window.getSelection().empty();
      } else if (window.getSelection().removeAllRanges) {
        window.getSelection().removeAllRanges();
      }
    } else if (document.selection) {
      document.selection.empty();
    }

    this._pickedStartDate = null;
    this._clearHighlight();
  }

  // prettier-ignore
  _initInputs() {
    this._inputInstances = SelectorEngine.find(
      '.form-outline',
      this._addEventModal
    ).map((formOutline) => {
      const instance = new mdb.Input(formOutline);
      instance.init();
      return instance;
    });
    this._inputInstances.push(...SelectorEngine.find(
      '.form-outline',
      this._editEventModal
    ).map((formOutline) => {
      const instance = new mdb.Input(formOutline);
      instance.init();
      return instance;
    }));
  }

  _updateInputs() {
    this._inputInstances.forEach((instance) => instance.update());
  }

  _initPickers() {
    /* eslint-disable no-new */
    SelectorEngine.find('.datepicker', this._addEventModal).forEach((formOutline) => {
      new mdb.Datepicker(formOutline);
    });
    SelectorEngine.find('.datepicker', this._editEventModal).forEach((formOutline) => {
      new mdb.Datepicker(formOutline);
    });
    SelectorEngine.find('.timepicker', this._addEventModal).forEach((formOutline) => {
      const input = SelectorEngine.findOne('input', formOutline);
      const value = input.value;
      new mdb.Timepicker(formOutline, { defaultTime: value, format24: !this.options.twelveHour });
    });
    SelectorEngine.find('.timepicker', this._editEventModal).forEach((formOutline) => {
      const input = SelectorEngine.findOne('input', formOutline);
      const value = input.value;
      new mdb.Timepicker(formOutline, { defaultTime: value, format24: !this.options.twelveHour });
    });
  }

  _addInputsListeners() {
    SelectorEngine.find('input', this._addEventModal).forEach((input) => {
      EventHandler.on(input, 'input', (e) => this._newEventUpdateData(e));
    });
    SelectorEngine.find('input', this._editEventModal).forEach((input) => {
      EventHandler.on(input, 'input', (e) => this._editActiveEventData(e));
    });
    SelectorEngine.find('textarea', this._addEventModal).forEach((textarea) => {
      EventHandler.on(textarea, 'input', (e) => this._newEventUpdateData(e));
    });
    SelectorEngine.find('textarea', this._editEventModal).forEach((textarea) => {
      EventHandler.on(textarea, 'input', (e) => this._editActiveEventData(e));
    });
    SelectorEngine.find('.datepicker', this._addEventModal).forEach((picker) => {
      const fakeEvent = {};
      const pickerToggler = SelectorEngine.findOne('.datepicker-toggle-button', picker);
      fakeEvent.target = SelectorEngine.findOne('input', picker);
      EventHandler.on(picker, 'dateChange.mdb.datepicker', () => {
        this._newEventUpdateData(fakeEvent);
      });
      EventHandler.on(pickerToggler, 'click', (e) => e.preventDefault());
    });
    SelectorEngine.find('.timepicker', this._addEventModal).forEach((picker) => {
      const fakeEvent = {};
      fakeEvent.target = SelectorEngine.findOne('input', picker);
      EventHandler.on(picker, 'input.mdb.timepicker', () => {
        this._newEventUpdateData(fakeEvent);
      });
    });
    SelectorEngine.find('.datepicker', this._editEventModal).forEach((picker) => {
      const fakeEvent = {};
      const pickerToggler = SelectorEngine.findOne('.datepicker-toggle-button', picker);
      fakeEvent.target = SelectorEngine.findOne('input', picker);
      EventHandler.on(picker, 'dateChange.mdb.datepicker', () => {
        this._editActiveEventData(fakeEvent);
      });
      EventHandler.on(pickerToggler, 'click', (e) => e.preventDefault());
    });
    SelectorEngine.find('.timepicker', this._editEventModal).forEach((picker) => {
      const fakeEvent = {};
      fakeEvent.target = SelectorEngine.findOne('input', picker);
      EventHandler.on(picker, 'input.mdb.timepicker', () => {
        this._editActiveEventData(fakeEvent);
      });
    });
  }

  _newEventUpdateData(e) {
    switch (e.target.name) {
      case 'summary':
        this._newEvent.summary = e.target.value;
        break;
      case 'description':
        this._newEvent.description = e.target.value;
        break;
      case 'start.date':
        this._newEvent.start.date = moment(e.target.value, this.formats.date);
        this._newEvent.start.dateTime = moment(
          `${e.target.value} ${this._newEvent.start.dateTime.format(this.formats.date)}`,
          this.formats.date
        );
        break;
      case 'end.date':
        this._newEvent.end.date = moment(e.target.value, this.formats.date);
        this._newEvent.end.dateTime = moment(
          `${e.target.value} ${this._newEvent.end.dateTime.format(this.formats.date)}`,
          this.formats.date
        );
        break;
      case 'start.time':
        this._newEvent.start.dateTime = moment(
          `${this._newEvent.start.date.format(this.formats.date)} ${e.target.value}`,
          this.formats.dateTime
        );
        break;
      case 'end.time':
        this._newEvent.end.dateTime = moment(
          `${this._newEvent.end.date.format(this.formats.date)} ${e.target.value}`,
          this.formats.dateTime
        );
        break;
      case 'color.background':
        if (!this._newEvent.color) this._newEvent.color = {};
        this._newEvent.color.background = e.target.value;
        break;
      default:
        return;
    }
    this._clearValidation();
  }

  _editActiveEventData(e) {
    switch (e.target.name) {
      case 'summary':
        this._activeEvent.summary = e.target.value;
        break;
      case 'description':
        this._activeEvent.description = e.target.value;
        break;
      case 'start.date':
        this._activeEvent.start.date = moment(e.target.value, this.formats.date);
        this._activeEvent.start.dateTime = moment(
          `${e.target.value} ${this._activeEvent.start.dateTime.format(this.formats.date)}`,
          this.formats.date
        );
        break;
      case 'end.date':
        this._activeEvent.end.date = moment(e.target.value, this.formats.date);
        this._activeEvent.end.dateTime = moment(
          `${e.target.value} ${this._activeEvent.end.dateTime.format(this.formats.date)}`,
          this.formats.date
        );
        break;
      case 'start.time':
        this._activeEvent.start.dateTime = moment(
          `${this._activeEvent.start.date.format(this.formats.date)} ${e.target.value}`,
          this.formats.dateTime
        );
        break;
      case 'end.time':
        this._activeEvent.end.dateTime = moment(
          `${this._activeEvent.end.date.format(this.formats.date)} ${e.target.value}`,
          this.formats.dateTime
        );
        break;
      case 'color.background':
        if (!this._activeEvent.color) this._activeEvent.color = {};
        this._activeEvent.color.background = e.target.value;
        break;
      default:
        return;
    }
    this._clearValidation();
  }

  _toggleInfoEventModal(e) {
    e.stopPropagation();
  }

  _toggleEditEventModal(e, event) {
    this._clearSelection();
    e.stopPropagation();
    if (e.which === 3) return;

    this._setActiveEvent(event);
    this._updateEditEventModalContent();
    if (!this._editEventModalInstance) {
      this._editEventModalInstance = new mdb.Modal(this._editEventModal);
    }
    this._editEventModalInstance.show();
    this._initInputs();
    this._initPickers();
    this._addInputsListeners();
  }

  _setActiveEvent(event) {
    this._activeEvent = {
      ...event,
      start: {
        ...event.start,
      },
      end: {
        ...event.end,
      },
      color: {
        ...event.color,
      },
    };
  }

  _appendCurrentMonthDays() {
    const firstDayOfActiveMonth = this.activeMomentCopy.startOf('month').day();
    const currentMonthDays = this._getArrayFromNumber(this.activeMomentCopy.daysInMonth());

    const arrayOfCurrentMonthDays = [];

    if (this.options.mondayFirst) {
      if (firstDayOfActiveMonth === 0) {
        arrayOfCurrentMonthDays.push(currentMonthDays.slice(0, 1));
        arrayOfCurrentMonthDays.push(currentMonthDays.slice(1, 8 - firstDayOfActiveMonth));
      } else {
        arrayOfCurrentMonthDays.push(currentMonthDays.slice(0, 8 - firstDayOfActiveMonth));
      }

      for (let i = 7; i <= 35; i += 7) {
        arrayOfCurrentMonthDays.push(
          currentMonthDays.slice(8 - firstDayOfActiveMonth + i - 7, 8 - firstDayOfActiveMonth + i)
        );
      }
    } else {
      arrayOfCurrentMonthDays.push(currentMonthDays.slice(0, 7 - firstDayOfActiveMonth));
      for (let i = 7; i <= 35; i += 7) {
        arrayOfCurrentMonthDays.push(
          currentMonthDays.slice(7 - firstDayOfActiveMonth + i - 7, 7 - firstDayOfActiveMonth + i)
        );
      }
    }

    this._createCurrentMonthDayFields(arrayOfCurrentMonthDays);
  }

  _createCurrentMonthDayFields(arrayOfCurrentMonthDays) {
    for (let i = 0; i < 6; i++) {
      for (let j = 0; j < arrayOfCurrentMonthDays[i].length; j++) {
        const td = element('td');
        const eventsWrapper = element('div');
        const dayField = element('div');

        Manipulator.addClass(eventsWrapper, CLASSNAME_EVENTS_WRAPPER);
        Manipulator.addClass(dayField, CLASSNAME_DAY_FIELD);

        const currentDay = arrayOfCurrentMonthDays[i][j] + 1;
        dayField.innerHTML = currentDay;
        const date = `${currentDay}/${this.activeMoment.month() + 1}/${this.activeMoment.year()}`;
        td.dataset.date = date;

        if (moment(date, this.formats.date).isSame(moment(), 'day')) {
          Manipulator.addClass(td, 'today');
        }

        td.append(dayField);
        td.append(eventsWrapper);
        SelectorEngine.find('tr', this._tBody)[i].append(td);

        if (!this.options.readonly) {
          this._addDayFieldListeners(td, date);
        }
      }
    }
  }

  _sortEvents() {
    this.events.sort((a, b) => moment(a.start.dateTime).diff(b.start.dateTime));
  }

  _addEventsKeys() {
    this.events.forEach((event, key) => (event.key = key + 1));
  }

  _setEvents() {
    this.events.forEach((event, key) => {
      this._appendEvent(event, key);
    });

    if (this.view === 'list') {
      this._appendEmptyList();
    }
  }

  _appendEvent(event) {
    switch (this.view) {
      case 'month':
        this._appendMonthEvent(event);
        break;
      case 'week':
        this._appendWeekEvent(event);
        break;
      case 'list':
        this._appendListEvent(event);
        break;
      default:
        return;
    }
  }

  _appendMonthEvent(event) {
    SelectorEngine.find('td', this._tBody).forEach((td) => {
      const tdDate = moment(td.dataset.date, this.formats.date);
      const eventEl = element('div');

      if (moment(event.start.date).isSame(tdDate)) {
        this._appendEventFirstDay(eventEl, event, td);
      } else if (
        moment(event.start.dateTime).isBefore(tdDate) &&
        moment(event.end.dateTime).isSameOrAfter(tdDate)
      ) {
        this._appendEventContinuation(eventEl, event, td);
      }

      if (this.options.readonly) {
        Manipulator.addClass(eventEl, 'event-readonly');
      } else {
        eventEl.setAttribute('draggable', true);
        this._appendMonthListeners(eventEl, event);
      }

      new Tooltip(eventEl, event, this.formats);
    });
  }

  _appendEventFirstDay(eventEl, event, td) {
    event.order = SelectorEngine.find('.event', td).length;
    Manipulator.style(eventEl, { order: event.key });
    Manipulator.addClass(eventEl, 'event');
    Manipulator.addClass(eventEl, `event-${event.key}`);
    Manipulator.setDataAttribute(eventEl, 'event-key', event.key);
    Manipulator.setDataAttribute(eventEl, 'event-order', event.order);

    if (
      event.start.dateTime.isSame(event.end.dateTime, 'day') &&
      !event.start.dateTime.isSame(event.end.dateTime, 'time')
    ) {
      const circle = element('i');
      ['fas', 'fa-circle', 'pe-1', 'event-circle'].forEach((className) => {
        Manipulator.addClass(circle, className);
      });
      Manipulator.addClass(eventEl, 'event-short');
      Manipulator.style(circle, { color: event.color && event.color.background });
      eventEl.append(circle);
    } else {
      Manipulator.style(eventEl, {
        background: event.color && event.color.background,
        color: event.color && event.color.foreground,
      });
    }

    eventEl.append(event.summary);
    SelectorEngine.findOne(`.${CLASSNAME_EVENTS_WRAPPER}`, td).append(eventEl);
  }

  _appendEventContinuation(eventEl, event, td) {
    eventEl.innerHTML = '&nbsp;';
    Manipulator.style(eventEl, {
      order: event.key,
      background: event.color && event.color.background,
      color: event.color && event.color.foreground,
    });

    Manipulator.setDataAttribute(eventEl, 'event-key', event.key);
    Manipulator.setDataAttribute(eventEl, 'event-order', event.order);
    ['event', `event-${event.key}`, 'event-long'].forEach((className) => {
      Manipulator.addClass(eventEl, className);
    });

    SelectorEngine.findOne(`.${CLASSNAME_EVENTS_WRAPPER}`, td).append(eventEl);
  }

  _appendMonthListeners(eventEl, event) {
    EventHandler.on(eventEl, 'dragstart', (e) => this._handleDragStart(e, event));
    EventHandler.on(eventEl, 'dragend', (e) => this._handleDragEnd(e, event));
    EventHandler.on(eventEl, 'mouseup', (e) => this._toggleEditEventModal(e, event));
    EventHandler.on(eventEl, 'mouseenter', () => this._markEvent(event));
    EventHandler.on(eventEl, 'mouseleave', () => this._unmarkEvent(event));
  }

  _markEvent(event) {
    SelectorEngine.find(`.event-${event.key}`, this._tBody).forEach((event) => {
      Manipulator.addClass(event, CLASSNAME_ACTIVE);
    });
  }

  _unmarkEvent(event) {
    SelectorEngine.find(`.event-${event.key}`, this._tBody).forEach((event) => {
      Manipulator.removeClass(event, CLASSNAME_ACTIVE);
    });
  }

  _handleDragStart(e, event) {
    this._hideTooltip(e);
    this._clearSelection();
    const eventElements = SelectorEngine.find(`.event-${event.key}`, this._tBody);
    eventElements.forEach((eventEl) => {
      Manipulator.addClass(eventEl, 'dragging');
    });
    e.dataTransfer.setData('text/plain', event.key);
  }

  _handleDragEnd(e, event) {
    const eventElements = SelectorEngine.find(`.event-${event.key}`, this._tBody);
    eventElements.forEach((eventEl) => {
      Manipulator.removeClass(eventEl, 'dragging');
    });
  }

  _handleDragOver(e) {
    if (e.preventDefault) {
      e.preventDefault();
    }

    return false;
  }

  _handleDragEnter(e) {
    Manipulator.addClass(e.target, 'dragenter');
  }

  _handleDragLeave(e) {
    Manipulator.removeClass(e.target, 'dragenter');
  }

  _handleDrop(e, date) {
    const eventKey = parseInt(e.dataTransfer.getData('text/plain'), 10);
    const event = this.events[eventKey - 1];
    const eventStartDate = moment(event.start.dateTime, this.formats.dateTime);
    const eventStartTime = moment(event.start.dateTime).format(this.formats.time);
    const eventEndDate = moment(event.end.dateTime, this.formats.dateTime);
    const eventDuration = eventEndDate.diff(eventStartDate);

    event.start = {
      date: moment(date, this.formats.date),
      dateTime: moment(`${date} ${eventStartTime}`, this.formats.dateTime),
    };

    event.end = {
      date: moment(date, this.formats.date).add(eventDuration),
      dateTime: moment(`${date} ${eventStartTime}`, this.formats.dateTime).add(eventDuration),
    };

    this.refresh();
  }

  _orderEvents() {
    SelectorEngine.find(`.${CLASSNAME_EVENTS_WRAPPER}`, this._tBody).forEach((eventsWrapper) => {
      const events = SelectorEngine.find('.event', eventsWrapper);
      for (let i = 0; i <= events.length; i++) {
        if (!events[i]) {
          return;
        }
        let isOrderCorrect =
          this._getAllPrevEl(events[i]).length < parseInt(events[i].dataset.mdbEventOrder, 10);

        while (isOrderCorrect) {
          const fakeEvent = element('div');
          fakeEvent.innerHTML = '&nbsp;';
          Manipulator.style(fakeEvent, { order: events[i].dataset.mdbEventOrder });
          Manipulator.addClass(fakeEvent, 'fake-event');
          eventsWrapper.insertBefore(fakeEvent, events[i]);

          SelectorEngine.find('div', eventsWrapper).forEach((event, key) => {
            if (event.dataset.mdbEventOrder < key) {
              SelectorEngine.find(`.event-${event.dataset.mdbEventKey}`, this._tBody).forEach(
                (event) => (event.dataset.mdbEventOrder = key)
              );
            }
          });

          isOrderCorrect =
            this._getAllPrevEl(events[i]).length < parseInt(events[i].dataset.mdbEventOrder, 10);
        }
      }
    });
  }

  _appendNextMonthDays() {
    const dayRows = SelectorEngine.find('tr', this._tBody);
    const numberOfEmptyFieldsInFifthRow = 7 - SelectorEngine.find('td', dayRows[4]).length;
    const numberOfEmptyFieldsInSixthRow = 7 - SelectorEngine.find('td', dayRows[5]).length;

    if (numberOfEmptyFieldsInFifthRow > 0) {
      this._appendEventsInRow(dayRows[4], numberOfEmptyFieldsInFifthRow);
    }

    if (numberOfEmptyFieldsInSixthRow > 0) {
      this._appendEventsInRow(
        dayRows[5],
        numberOfEmptyFieldsInSixthRow,
        numberOfEmptyFieldsInFifthRow
      );
    }
  }

  _appendEventsInRow(row, sixthRowEmptyFields, fifthRowEmptyFields = 0) {
    for (let i = 0; i < sixthRowEmptyFields; i++) {
      const eventsWrapper = element('div');
      const td = element('td');
      const dayField = element('div');

      Manipulator.addClass(eventsWrapper, CLASSNAME_EVENTS_WRAPPER);
      Manipulator.addClass(td, 'disabled');
      Manipulator.addClass(dayField, 'day-field');

      dayField.innerHTML = i + 1 + fifthRowEmptyFields;

      const date = `${i + 1 + fifthRowEmptyFields}/${
        this.activeMomentCopy.startOf('month').add(1, 'month').month() + 1
      }/${this.activeMomentCopy.startOf('month').add(1, 'month').year()}`;
      td.dataset.date = date;

      td.append(dayField);
      td.append(eventsWrapper);
      row.append(td);

      if (!this.options.readonly) {
        this._addDayFieldListeners(td, date);
      }
    }
  }

  _appendWeekEvent(event) {
    this._appendLongWeekEvent(event);
    this._appendDateTimeWeekEvent(event);
  }

  _appendLongWeekEvent(event) {
    SelectorEngine.find('tr.long-event-row td', this._tBody).forEach((td, key) => {
      const tdDate = this.options.mondayFirst
        ? this.activeMomentCopy.startOf('week').add(key, 'day').add(1, 'day')
        : this.activeMomentCopy.startOf('week').add(key, 'day');

      const eventEl = element('div');

      if (moment(event.start.date).isSame(tdDate)) {
        Manipulator.style(eventEl, {
          order: event.key,
        });

        event.order = SelectorEngine.find('.event', td).length;

        Manipulator.addClass(eventEl, 'event');
        Manipulator.addClass(eventEl, `event-${event.key}`);
        Manipulator.setDataAttribute(eventEl, 'event-key', event.key);
        Manipulator.setDataAttribute(eventEl, 'event-order', event.order);

        if (
          event.start.dateTime.isSame(event.end.dateTime, 'day') &&
          !event.start.dateTime.isSame(event.end.dateTime, 'time')
        ) {
          const circle = element('i');
          ['fas', 'fa-circle', 'pe-1', 'event-circle'].forEach((className) => {
            Manipulator.addClass(circle, className);
          });
          Manipulator.addClass(eventEl, 'event-short');
          Manipulator.style(circle, { color: event.color && event.color.background });
          eventEl.append(circle);
        } else {
          Manipulator.style(eventEl, {
            background: event.color && event.color.background,
            color: event.color && event.color.foreground,
          });
        }

        eventEl.append(event.summary);

        SelectorEngine.findOne(`.${CLASSNAME_EVENTS_WRAPPER}`, td).append(eventEl);

        if (this.options.readonly) {
          Manipulator.addClass(eventEl, 'event-readonly');
        } else {
          eventEl.setAttribute('draggable', true);
          this._appendMonthListeners(eventEl, event);
        }
      }

      if (
        moment(event.start.dateTime).isBefore(tdDate) &&
        moment(event.end.dateTime).isSameOrAfter(tdDate)
      ) {
        eventEl.innerHTML = '&nbsp;';
        Manipulator.style(eventEl, {
          order: event.key,
          background: event.color && event.color.background,
          color: event.color && event.color.foreground,
        });

        Manipulator.setDataAttribute(eventEl, 'event-key', event.key);
        Manipulator.setDataAttribute(eventEl, 'event-order', event.order);
        ['event', `event-${event.key}`, 'event-long'].forEach((className) => {
          Manipulator.addClass(eventEl, className);
        });

        SelectorEngine.findOne(`.${CLASSNAME_EVENTS_WRAPPER}`, td).append(eventEl);

        if (this.options.readonly) {
          Manipulator.addClass(eventEl, 'event-readonly');
        } else {
          eventEl.setAttribute('draggable', true);
          this._appendMonthListeners(eventEl, event);
        }
      }

      new Tooltip(eventEl, event, this.formats);
    });
  }

  _appendDateTimeWeekEvent(event) {
    if (
      event.start.dateTime.isSame(event.end.dateTime, 'day') &&
      !event.start.dateTime.isSame(event.end.dateTime, 'time')
    ) {
      SelectorEngine.find('tr:not(.long-event-row) td', this._tBody).forEach((td) => {
        const tdDate = moment(td.dataset.dateTime, this.formats.dateTime);
        if (
          moment(event.start.dateTime, this.formats.dateTime).isSameOrBefore(tdDate) &&
          !moment(event.end.dateTime, this.formats.dateTime).isSameOrBefore(tdDate)
        ) {
          const eventEl = element('div');
          ['event', 'event-short', `event-${event.key}`].forEach((className) => {
            Manipulator.addClass(eventEl, className);
          });
          eventEl.innerHTML = `<i class="fas fa-circle event-circle pe-1" style="color: ${event.color.background}"></i>${event.summary}`;

          td.append(eventEl);

          if (this.options.readonly) {
            Manipulator.addClass(eventEl, 'event-readonly');
          } else {
            eventEl.setAttribute('draggable', true);
            this._appendMonthListeners(eventEl, event);
          }

          new Tooltip(eventEl, event, this.formats);
        }
      });
    }
  }

  _appendEmptyList() {
    if (!SelectorEngine.find('td', this._tBody).length) {
      const tr = element('tr');
      const th = element('th');

      th.innerHTML = this.options.noEventsCaption;
      tr.append(th);
      this._tBody.append(tr);
    }
  }

  _appendListEvent(event) {
    const weekStartDate = this.activeMomentCopy.startOf('week');
    const weekEndDate = this.activeMomentCopy.endOf('week');
    if (this.options.mondayFirst) {
      weekStartDate.add(1, 'day');
      weekEndDate.add(1, 'day');
    }

    if (
      moment(event.start.dateTime).isBefore(weekEndDate) &&
      moment(event.end.dateTime).isAfter(weekStartDate)
    ) {
      const headingTr = element('tr');
      const summaryTr = element('tr');
      const headingTh = element('th');
      const summaryTd = element('td');

      headingTh.innerHTML = eventTimePeriod(event, this.formats);
      const eventBg = event.color.background || '#1266F1';
      summaryTd.innerHTML = `<i class="pe-2 fas fa-circle" style="color: ${eventBg}"></i><strong>${event.summary}</strong>`;

      headingTr.append(headingTh);
      summaryTr.append(summaryTd);
      this._tBody.append(headingTr);
      this._tBody.append(summaryTr);

      if (event.description) {
        this._addListEventDescription(summaryTd, event.description);
      }

      if (this.options.readonly) {
        Manipulator.addClass(summaryTd, 'td-readonly');
      } else {
        EventHandler.on(summaryTd, 'mouseup', (e) => this._toggleEditEventModal(e, event));
      }
    }
  }

  _addListEventDescription(summaryTd, eventDescription) {
    const description = element('p');
    Manipulator.addClass(description, 'mb-0');
    description.innerHTML = `<small>${eventDescription}</small>`;
    summaryTd.append(description);
  }

  _appendLongEventSection() {
    const longEventsSection = element('tr');
    Manipulator.addClass(longEventsSection, CLASSNAME_ALL_DAY_ROW);
    const th = element('th');
    longEventsSection.append(th);

    for (let i = 0; i < 7; i++) {
      const td = element('td');
      const eventsWrapper = element('div');

      Manipulator.addClass(eventsWrapper, CLASSNAME_EVENTS_WRAPPER);
      td.append(eventsWrapper);
      longEventsSection.append(td);

      // prettier-ignore
      const date = this.options.mondayFirst
        ? this.activeMomentCopy.startOf('week').add(i + 1, 'day').format(this.formats.date)
        : this.activeMomentCopy.startOf('week').add(i, 'day').format(this.formats.date);
      td.dataset.date = date;

      if (moment(date, this.formats.date).isSame(moment(), 'day')) {
        Manipulator.addClass(td, 'today');
      }

      if (!this.options.readonly) {
        this._addDayFieldListeners(td, date);
      }
    }

    this._tBody.append(longEventsSection);
  }

  _appendHoursSection() {
    for (let i = 0; i < 23; i++) {
      const tr = element('tr');
      const th = element('th');
      Manipulator.addClass(th, 'hour-field');

      if (this.options.twelveHour) {
        if (i > 11) {
          th.innerHTML = `${i - 11}:00 pm`;
        } else if (i === 11) {
          th.innerHTML = `${i + 1}:00 pm`;
        } else {
          th.innerHTML = `${i + 1}:00 am`;
        }
      } else {
        th.innerHTML = `${i + 1}:00`;
      }
      tr.append(th);

      for (let j = 0; j < 7; j++) {
        const td = element('td');

        // prettier-ignore
        const date = this.options.mondayFirst
          ? this.activeMomentCopy.startOf('week').add(j + 1, 'day').add(i + 1, 'hour').format(this.formats.dateTime)
          : this.activeMomentCopy.startOf('week').add(j, 'day').add(i + 1, 'hour').format(this.formats.dateTime);

        td.dataset.dateTime = date;

        tr.append(td);

        if (!this.options.readonly) {
          this._addDayFieldListeners(td, date);
        }
      }

      this._tBody.append(tr);
    }
  }

  _setHeading() {
    this._heading.innerHTML = '';
    switch (this.view) {
      case 'month':
        this._heading.innerHTML = `${
          this.options.months[this.activeMomentCopy.month()]
        } ${this.activeMomentCopy.year()}`;
        break;
      case 'week':
      case 'list':
        this._setWeekAndListHeading();
        break;
      default:
        return;
    }
  }

  _setWeekAndListHeading() {
    const start = this.options.mondayFirst
      ? this.activeMomentCopy.startOf('week').add(1, 'day')
      : this.activeMomentCopy.startOf('week');

    const end = this.options.mondayFirst
      ? this.activeMomentCopy.endOf('week').add(1, 'day')
      : this.activeMomentCopy.endOf('week');

    const startMonth = this.options.monthsShort[start.month()];
    const startDate = start.date();

    const endMonth = this.options.monthsShort[end.month()];
    const endDate = end.date();

    this._heading.innerHTML = `${startMonth} ${startDate} - ${endMonth} ${endDate}, ${start.year()}`;
  }

  _clearTBody() {
    this._tBody.innerHTML = '';
    this._table.className = '';
  }

  _addListeners() {
    EventHandler.on(this._arrowLeft, 'click', () => this.prev());
    EventHandler.on(this._arrowRight, 'click', () => this.next());
    EventHandler.on(this._todayBtn, 'click', () => this.today());
    EventHandler.on(this._monthBtn, 'click', () => this.changeView('month'));
    EventHandler.on(this._weekBtn, 'click', () => this.changeView('week'));
    EventHandler.on(this._listBtn, 'click', () => this.changeView('list'));
    EventHandler.on(this._table, 'mouseup', () => this._clearSelection());
  }

  _removeListeners() {
    EventHandler.off(this._arrowLeft, 'click', this.prev);
    EventHandler.off(this._arrowRight, 'click', this.next);
    EventHandler.off(this._todayBtn, 'click', this.today);
    EventHandler.off(this._monthBtn, 'click', this.changeView);
    EventHandler.off(this._weekBtn, 'click', this.changeView);
    EventHandler.off(this._listBtn, 'click', this.changeView);
    EventHandler.off(this._table, 'mouseup', this._clearSelection);
  }

  _getArrayFromNumber(number) {
    return Array.from(Array(number).keys());
  }

  _getAllPrevEl(element) {
    const result = [];
    let child = element.previousElementSibling;

    while (child) {
      result.push(element);
      child = child.previousElementSibling;
    }
    return result;
  }

  _setLongEventCaptions() {
    if (this.view === 'list') return;
    SelectorEngine.find('tr', this._tBody).forEach((tr) => {
      const firstTd = SelectorEngine.findOne('td', tr);
      SelectorEngine.find('.event', firstTd).forEach((event) => {
        if (event.innerHTML === '&nbsp;') {
          event.innerHTML = this.events[parseInt(event.dataset.mdbEventKey, 10) - 1].summary;
          Manipulator.style(event, { paddingLeft: '7px' });
        }
      });
    });
  }

  _initTooltips() {
    this._tooltips = [...this._element.querySelectorAll('[data-mdb-toggle="tooltip"]')].map(
      (tooltip) => new mdb.Tooltip(tooltip)
    );
  }

  _hideTooltip(e) {
    mdb.Tooltip.getInstance(e.target).hide();
  }

  _refreshTable() {
    this._setTBody();
    this._setHeading();
    this._setEvents();
    this._orderEvents();
    this._setLongEventCaptions();
    this._initTooltips();
  }

  // MODALS ---------------------------------------------
  _createAddEventModal() {
    this._addEventModal = element('div');
    Manipulator.addClass(this._addEventModal, 'modal');
    Manipulator.addClass(this._addEventModal, 'fade');
    this._addEventModal.setAttribute('tabindex', '-1');
    this._addEventModal.setAttribute('aria-hidden', 'true');

    document.body.appendChild(this._addEventModal);
  }

  _updateAddEventModalContent() {
    this._addEventModal.innerHTML = addModalTemplate(
      this.options,
      this._newEvent,
      this.formats,
      this._addModalId
    );

    const longEventsCheckbox = SelectorEngine.findOne(
      SELECTOR_CALENDAR_LONG_EVENTS_CHECKBOX,
      this._addEventModal
    );
    EventHandler.on(longEventsCheckbox, 'change', (e) => this._toggleLongEventMode(e));

    this._editAddModalIfLongEvent(this._newEvent, longEventsCheckbox);

    const form = SelectorEngine.findOne('form', this._addEventModal);
    EventHandler.on(form, 'submit', (e) => {
      this._addEvent(e);
      this._triggerEvent('addEvent');
    });
  }

  _toggleLongEventMode(e) {
    const isLongEventEnabled = e.target.checked;
    const longEventsSections = SelectorEngine.find('.long-event-section', this._addEventModal);
    const dateTimeSections = SelectorEngine.find('.date-time-section', this._addEventModal);

    if (isLongEventEnabled) {
      longEventsSections.forEach((section) => (section.style.display = 'block'));
      dateTimeSections.forEach((section) => (section.style.display = 'none'));
    } else {
      longEventsSections.forEach((section) => (section.style.display = 'none'));
      dateTimeSections.forEach((section) => (section.style.display = 'block'));
    }

    this._updateInputs();
  }

  _toggleLongEventModeInEditModal(e) {
    const isLongEventEnabled = e.target.checked;
    const longEventsSections = SelectorEngine.find('.long-event-section', this._editEventModal);
    const dateTimeSections = SelectorEngine.find('.date-time-section', this._editEventModal);

    if (isLongEventEnabled) {
      longEventsSections.forEach((section) => (section.style.display = 'block'));
      dateTimeSections.forEach((section) => {
        SelectorEngine.find('.timepicker-input', section).forEach((input) => {
          input.value = '00:00';
          this._activeEvent.start.dateTime = moment(this._activeEvent.start.dateTime).startOf(
            'day'
          );
          this._activeEvent.end.dateTime = moment(this._activeEvent.end.dateTime).startOf('day');
        });
        section.style.display = 'none';
      });
    } else {
      longEventsSections.forEach((section) => (section.style.display = 'none'));
      dateTimeSections.forEach((section) => (section.style.display = 'block'));
    }

    this._updateInputs();
  }

  _createEditEventModal() {
    this._editEventModal = element('div');
    Manipulator.addClass(this._editEventModal, 'modal');
    Manipulator.addClass(this._editEventModal, 'fade');
    this._editEventModal.setAttribute('tabindex', '-1');
    this._editEventModal.setAttribute('aria-hidden', 'true');

    document.body.appendChild(this._editEventModal);
  }

  _updateEditEventModalContent() {
    this._editEventModal.innerHTML = editModalTemplate(
      this.options,
      this._activeEvent,
      this.formats,
      this._editModalId
    );

    const longEventsCheckbox = SelectorEngine.findOne(
      SELECTOR_CALENDAR_LONG_EVENTS_CHECKBOX,
      this._editEventModal
    );
    EventHandler.on(longEventsCheckbox, 'change', (e) => this._toggleLongEventModeInEditModal(e));

    this._editModalIfLongEvent(this._activeEvent, longEventsCheckbox);

    const activeCheckbox = SelectorEngine.findOne(
      `input[value="${this._activeEvent.color.background}"]`,
      this._editEventModal
    );
    if (activeCheckbox) {
      activeCheckbox.checked = true;
    } else {
      SelectorEngine.findOne('input[type="radio"]', this._editEventModal).checked = true;
    }
    const submitBtn = SelectorEngine.findOne('.btn-edit-event', this._editEventModal);
    const deleteBtn = SelectorEngine.findOne('.btn-delete-event', this._editEventModal);
    EventHandler.on(submitBtn, 'click', () => {
      this._editEvent();
      this._triggerEvent('editEvent');
    });
    EventHandler.on(deleteBtn, 'click', () => {
      this._deleteEvent();
      this._triggerEvent('deleteEvent');
    });
  }

  _editAddModalIfLongEvent(event, checkbox) {
    if (eventType(event) === 'short-event' || eventType(event) === 'long-event-with-time') {
      checkbox.checked = false;
      const longEventsSections = SelectorEngine.find('.long-event-section', this._addEventModal);
      const dateTimeSections = SelectorEngine.find('.date-time-section', this._addEventModal);
      longEventsSections.forEach((section) => (section.style.display = 'none'));
      dateTimeSections.forEach((section) => (section.style.display = 'block'));
    }
  }

  _editModalIfLongEvent(event, checkbox) {
    if (eventType(event) === 'short-event' || eventType(event) === 'long-event-with-time') {
      checkbox.checked = false;
      const longEventsSections = SelectorEngine.find('.long-event-section', this._editEventModal);
      const dateTimeSections = SelectorEngine.find('.date-time-section', this._editEventModal);
      longEventsSections.forEach((section) => (section.style.display = 'none'));
      dateTimeSections.forEach((section) => (section.style.display = 'block'));
    }
  }

  _addEvent(e) {
    e.preventDefault();
    if (this._validateEvent(this._newEvent)) {
      this.events.push({
        summary: this._newEvent.summary,
        start: this._newEvent.start,
        end: this._newEvent.end,
        color: this._newEvent.color || {},
        description: this._newEvent.description || '',
      });

      EventHandler.trigger(this._element, 'addEvent.mdb.calendar', this._newEvent);
      this.refresh();
      this._addEventModalInstance.hide();
    } else {
      this._setInputsInvalid(this._newEvent);
    }
  }

  _validateEvent(event) {
    if (event.start.dateTime.isSameOrBefore(event.end.dateTime) && event.summary) {
      return true;
    }
    return false;
  }

  _setInputsInvalid(event) {
    if (event.end.dateTime.isSameOrBefore(event.start.dateTime)) {
      SelectorEngine.find('.calendar-date-input').forEach((input) => {
        Manipulator.addClass(input, 'calendar-invalid-input');
        Manipulator.addClass(input.parentNode.parentNode, 'was-validated');
      });
    }
    if (event.summary === '') {
      SelectorEngine.find('.calendar-summary-input').forEach((input) => {
        Manipulator.addClass(input, 'calendar-invalid-input');
        Manipulator.addClass(input.parentNode.parentNode, 'was-validated');
      });
    }
  }

  _clearValidation() {
    SelectorEngine.find('.calendar-date-input').forEach((input) => {
      Manipulator.removeClass(input, 'calendar-invalid-input');
      Manipulator.removeClass(input.parentNode.parentNode, 'was-validated');
    });
    SelectorEngine.find('.calendar-summary-input').forEach((input) => {
      Manipulator.removeClass(input, 'calendar-invalid-input');
      Manipulator.removeClass(input.parentNode.parentNode, 'was-validated');
    });
  }

  _editEvent() {
    if (this._validateEvent(this._activeEvent)) {
      this.events[this.activeEventIndex].summary = this._activeEvent.summary;
      this.events[this.activeEventIndex].start.date = this._activeEvent.start.date;
      this.events[this.activeEventIndex].start.dateTime = this._activeEvent.start.dateTime;
      this.events[this.activeEventIndex].end.date = this._activeEvent.end.date;
      this.events[this.activeEventIndex].end.dateTime = this._activeEvent.end.dateTime;
      this.events[this.activeEventIndex].description = this._activeEvent.description;
      this.events[this.activeEventIndex].color.background =
        this._activeEvent.color && this._activeEvent.color.background;

      EventHandler.trigger(this._element, 'editEvent.mdb.calendar', this._activeEvent);
      this.refresh();
      this._editEventModalInstance.hide();
    } else {
      this._setInputsInvalid(this._activeEvent);
    }
  }

  _deleteEvent() {
    EventHandler.trigger(
      this._element,
      'deleteEvent.mdb.calendar',
      this.events[this.activeEventIndex]
    );
    this.events.splice(this.activeEventIndex, 1);
    this.refresh();
    this._editEventModalInstance.hide();
  }

  _clearEvents() {
    SelectorEngine.find('.event', this._element).forEach((event) => {
      event.remove();
    });
  }

  _triggerEvent(event) {
    EventHandler.trigger(this._element, `${event}.calendar`);
  }

  _disposeModals() {
    if (this._addEventModalInstance) {
      this._addEventModalInstance.dispose();
    }
    if (this._addEventModal) {
      this._addEventModal.remove();
    }
    if (this._editEventModalInstance) {
      this._editEventModalInstance.dispose();
    }
    if (this._editEventModal) {
      this._editEventModal.remove();
    }
  }

  // Static
  static get NAME() {
    return NAME;
  }

  static get moment() {
    return moment();
  }

  static getInstance(element) {
    return Data.getData(element, DATA_KEY);
  }

  static jQueryInterface(config, options) {
    return this.each(function () {
      let data = Data.getData(this, DATA_KEY);
      const _config = typeof config === 'object' && config;
      if (!data && /dispose/.test(config)) {
        return;
      }
      if (!data) {
        data = new Calendar(this, _config);
      }
      if (typeof config === 'string') {
        if (typeof data[config] === 'undefined') {
          throw new TypeError(`No method named "${config}"`);
        }
        data[config](options);
      }
    });
  }
}

onDOMContentLoaded(() => {
  const $ = getjQuery();

  if ($) {
    const JQUERY_NO_CONFLICT = $.fn[NAME];
    $.fn[NAME] = Calendar.jQueryInterface;
    $.fn[NAME].Constructor = Calendar;
    $.fn[NAME].noConflict = () => {
      $.fn[NAME] = JQUERY_NO_CONFLICT;
      return Calendar.jQueryInterface;
    };
  }
});

SelectorEngine.find(`.${CLASSNAME_CALENDAR}`).forEach((el) => new Calendar(el));

export default Calendar;
