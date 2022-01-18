import moment from 'moment';

export function addModalTemplate(options, newEvent, formats, id) {
  return `
  <div class="modal-dialog">
    <form>
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">${options.addEventModalCaption}</h5>
          <button type="button" class="close" data-mdb-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <section class="summary-section">
            <div class="form-outline my-3">
              <input type="text" id="${id}addEventSummary" name="summary" class="form-control calendar-summary-input"
              value='${newEvent.summary}' />
              <label class="form-label" for="${id}addEventSummary">${options.summaryCaption}</label>
            </div>
          </section>
          <div class="form-outline my-3">
            <textarea type="text" id="${id}addEventDescription" name="description" 
              class="form-control">${newEvent.description}</textarea>
            <label class="form-label" for="${id}addEventDescription">
              ${options.descriptionCaption}
            </label>
          </div>
          <div class="form-check mx-2">
            <input
              class="form-check-input calendar-long-events-checkbox"
              type="checkbox"
              checked
              id="${id}longEventsCheckbox"
            />
            <label class="form-check-label" for="${id}longEventsCheckbox">
              ${options.allDayCaption}
            </label>
          </div>
          <section class="long-event-section">
            <div class="form-outline datepicker my-3">
              <input type="text" id="${id}addEventStartDate" name="start.date" class="form-control calendar-date-input"
              value='${moment(newEvent.start.date).format(formats.date)}' />
              <label class="form-label" for="${id}addEventStartDate">
                ${options.startCaption}
              </label>
            </div>
          </section>
          <section class="date-time-section" style="display: none">
            <div class="row my-3">
              <div class="col-6">
                <div class="form-outline datepicker">
                  <input type="text" id="${id}addEventStartDate2" name="start.date" class="form-control calendar-date-input"
                  value='${moment(newEvent.start.dateTime).format(formats.date)}' />
                  <label class="form-label" for="${id}addEventStartDate2">
                    ${options.startCaption}
                  </label>
                </div>
              </div>
              <div class="col-6">
                <div class="form-outline timepicker">
                  <input type="text" id="${id}addEventStartDateTime" name="start.time" class="form-control calendar-date-input" 
                  value=
                  '${moment(newEvent.start.dateTime).format(formats.time)}' 
                  />
                  <label class="form-label" for="${id}addEventStartDateTime">
                    ${options.startCaption}
                  </label>
                </div>
              </div>
            </div>
          </section>
          <section class="long-event-section">
            <div class="form-outline datepicker my-3">
              <input type="text" id="${id}addEventEndDate" name="end.date" class="form-control calendar-date-input"
              value='${moment(newEvent.end.date).format(formats.date)}' />
              <label class="form-label" for="${id}addEventEndDate">
                ${options.endCaption}
              </label>
            </div>
          </section>
          <section class="date-time-section" style="display: none">
            <div class="row my-3">
              <div class="col-6">
                <div class="form-outline datepicker">
                  <input type="text" id="${id}addEventEndDate2" name="end.date" class="form-control calendar-date-input"
                  value='${moment(newEvent.end.dateTime).format(formats.date)}' />
                  <label class="form-label" for="${id}addEventEndDate2">
                    ${options.endCaption}
                  </label>
                </div>
              </div>
              <div class="col-6">
                <div class="form-outline timepicker">
                  <input type="text" id="${id}addEventEndDateTime" name="end.time" class="form-control calendar-date-input" 
                  value=
                  '${moment(newEvent.end.dateTime).format(formats.time)}' 
                  />
                  <label class="form-label" for="${id}addEventEndDateTime">
                    ${options.endCaption}
                  </label>
                </div>
              </div>
            </div>
          </section>
          <div class="text-center mt-3">
            <div class="form-check form-check-inline ml-2">
              <input class="form-check-input" type="radio" id="${id}addEventRadioBackgroundPrimary"
              name="color.background" value="#1266F1" checked />
              <label class="form-check-label text-primary" for="${id}addEventRadioBackgroundPrimary"><i class="fas fa-circle" style="color: #1266F1"></i></label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" id="${id}addEventRadioBackgroundSecondary"
              name="color.background" value="#B23CFD" />
              <label class="form-check-label text-secondary" for="${id}addEventRadioBackgroundSecondary"><i class="fas fa-circle" style="color: #B23CFD"></i></label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" id="${id}addEventRadioBackgroundSuccess"
              name="color.background" value="#00B74A" />
              <label class="form-check-label text-success" for="${id}addEventRadioBackgroundSuccess"><i class="fas fa-circle" style="color: #00B74A"></i></label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" id="${id}addEventRadioBackgroundDanger"
              name="color.background" value="#F93154" />
              <label class="form-check-label text-danger" for="${id}addEventRadioBackgroundDanger"><i class="fas fa-circle" style="color: #F93154"></i></label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" id="${id}addEventRadioBackgroundWarning"
              name="color.background" value="#FFA900" />
              <label class="form-check-label text-warning" for="${id}addEventRadioBackgroundWarning"><i class="fas fa-circle" style="color: #FFA900"></i></label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" id="${id}addEventRadioBackgroundInfo"
              name="color.background" value="#39C0ED" />
              <label class="form-check-label text-info" for="${id}addEventRadioBackgroundInfo"><i class="fas fa-circle" style="color: #39C0ED"></i></label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" id="${id}addEventRadioBackgroundDark"
              name="color.background" value="#262626" />
              <label class="form-check-label text-dark" for="${id}addEventRadioBackgroundDark"><i class="fas fa-circle" style="color: #262626"></i></label>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-mdb-dismiss="modal">
            ${options.closeCaption}
          </button>
          <button type="submit" class="btn btn-primary btn-add-event">
            ${options.addCaption}
          </button>
        </div>
      </div>
    </form>
  </div>`;
}

export function editModalTemplate(options, activeEvent, formats, id) {
  return `
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">${options.editEventModalCaption}</h5>
        <button type="button" class="close" data-mdb-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <section class="summary-section">
          <div class="form-outline my-3">
            <input type="text" id="${id}editEventSummary" name="summary" class="form-control calendar-summary-input"
            value='${activeEvent.summary}' />
            <label class="form-label" for="${id}editEventSummary">${options.summaryCaption}</label>
          </div>
        </section>
        <div class="form-outline my-3">
          <textarea type="text" id="${id}editEventDescription" name="description" 
            class="form-control" rows="3"
            >${activeEvent.description === undefined ? '' : activeEvent.description}</textarea>
          <label class="form-label" for="${id}editEventDescription">
            ${options.descriptionCaption}
          </label>
        </div>
        <div class="form-check mx-2">
          <input
            class="form-check-input calendar-long-events-checkbox"
            type="checkbox"
            checked
            id="${id}longEventsCheckbox"
          />
          <label class="form-check-label" for="${id}longEventsCheckbox">
            ${options.allDayCaption}
          </label>
        </div>
        <section class="long-event-section">
          <div class="form-outline datepicker my-3">
            <input type="text" id="${id}editEventStartDate" name="start.date" class="form-control calendar-date-input"
            value='${moment(activeEvent.start.date).format(formats.date)}' />
            <label class="form-label" for="${id}editEventStartDate">
              ${options.startCaption}
            </label>
          </div>
        </section>
        <section class="date-time-section" style="display: none">
          <div class="row my-3">
            <div class="col-6">
              <div class="form-outline datepicker">
                <input type="text" id="${id}editEventStartDate2" name="start.date" class="form-control calendar-date-input"
                value='${moment(activeEvent.start.dateTime).format(formats.date)}' />
                <label class="form-label" for="${id}editEventStartDate2">
                  ${options.startCaption}
                </label>
              </div>
            </div>
            <div class="col-6">
              <div class="form-outline timepicker">
                <input type="text" id="${id}editEventStartDateTime" name="start.time" class="form-control calendar-date-input" 
                value=
                '${moment(activeEvent.start.dateTime).format(formats.time)}' 
                />
                <label class="form-label" for="${id}editEventStartDateTime">
                  ${options.startCaption}
                </label>
              </div>
            </div>
          </div>
        </section>
        <section class="long-event-section">
          <div class="form-outline datepicker my-3">
            <input type="text" id="${id}editEventEndDate" name="end.date" class="form-control calendar-date-input"
            value='${moment(activeEvent.end.date).format(formats.date)}' />
            <label class="form-label" for="${id}editEventEndDate">
              ${options.endCaption}
            </label>
          </div>
        </section>
        <section class="date-time-section" style="display: none">
          <div class="row my-3">
            <div class="col-6">
              <div class="form-outline datepicker">
                <input type="text" id="${id}editEventEndDate2" name="end.date" class="form-control calendar-date-input"
                value='${moment(activeEvent.end.dateTime).format(formats.date)}' />
                <label class="form-label" for="${id}editEventEndDate2">
                  ${options.endCaption}
                </label>
              </div>
            </div>
            <div class="col-6">
              <div class="form-outline timepicker">
                <input type="text" id="${id}editEventEndDateTime" name="end.time" class="form-control calendar-date-input" 
                value=
                '${moment(activeEvent.end.dateTime).format(formats.time)}' 
                />
                <label class="form-label" for="${id}editEventEndDateTime">
                  ${options.endCaption}
                </label>
              </div>
            </div>
          </div>
        </section>
        <div class="text-center mt-2">
          <div class="form-check form-check-inline ml-2">
            <input class="form-check-input" type="radio" id="${id}editEventRadioBackgroundPrimary"
            name="color.background" value="#1266F1" checked />
            <label class="form-check-label text-primary" for="${id}editEventRadioBackgroundPrimary"><i class="fas fa-circle" style="color: #1266F1"></i></label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" id="${id}editEventRadioBackgroundSecondary"
            name="color.background" value="#B23CFD" />
            <label class="form-check-label text-secondary" for="${id}editEventRadioBackgroundSecondary"><i class="fas fa-circle" style="color: #B23CFD"></i></label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" id="${id}editEventRadioBackgroundSuccess"
            name="color.background" value="#00B74A" />
            <label class="form-check-label text-success" for="${id}editEventRadioBackgroundSuccess"><i class="fas fa-circle" style="color: #00B74A"></i></label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" id="${id}editEventRadioBackgroundDanger"
            name="color.background" value="#F93154" />
            <label class="form-check-label text-danger" for="${id}editEventRadioBackgroundDanger"><i class="fas fa-circle" style="color: #F93154"></i></label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" id="${id}editEventRadioBackgroundWarning"
            name="color.background" value="#FFA900" />
            <label class="form-check-label text-warning" for="${id}editEventRadioBackgroundWarning"><i class="fas fa-circle" style="color: #FFA900"></i></label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" id="${id}editEventRadioBackgroundInfo"
            name="color.background" value="#39C0ED" />
            <label class="form-check-label text-info" for="${id}editEventRadioBackgroundInfo"><i class="fas fa-circle" style="color: #39C0ED"></i></label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" id="${id}editEventRadioBackgroundDark"
            name="color.background" value="#262626" />
            <label class="form-check-label text-dark" for="${id}editEventRadioBackgroundDark"><i class="fas fa-circle" style="color: #262626"></i></label>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger btn-delete-event" >
          ${options.deleteCaption}
        </button>
        <button type="button" class="btn btn-primary btn-edit-event">
          ${options.editCaption}
        </button>
      </div>
    </div>
  </div>
  `;
}
