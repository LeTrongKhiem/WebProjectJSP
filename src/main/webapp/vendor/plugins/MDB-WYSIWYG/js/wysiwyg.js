"use strict";

function _instanceof(left, right) { if (right != null && typeof Symbol !== "undefined" && right[Symbol.hasInstance]) { return !!right[Symbol.hasInstance](left); } else { return left instanceof right; } }

function _classCallCheck(instance, Constructor) { if (!_instanceof(instance, Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

/*
 * MDBootstrap WYSIWYG Plugin
 * MDBootstrap (C) 2019
 */
(function ($) {
  var WYSIWYG =
  /*#__PURE__*/
  function () {
    function WYSIWYG(element, options) {
      _classCallCheck(this, WYSIWYG);

      this.defaults = {
        tooltips: true,
        translations: {
          paragraph: 'Paragraph',
          heading: 'Heading',
          preformatted: 'Preformatted',
          bold: 'Bold',
          italic: 'Italic',
          strikethrough: 'Strikethrough',
          underline: 'Underline',
          textcolor: 'Color',
          alignleft: 'Align Left',
          aligncenter: 'Align Center',
          alignright: 'Align Right',
          alignjustify: 'Align Justify',
          insertlink: 'Insert Link',
          insertpicture: 'Insert Picture',
          bulletlist: 'Ordered List',
          numberedlist: 'Numbered List',
          enterurl: 'Enter a URL',
          imageurl: 'Image URL',
          linkdescription: 'Enter a description for this link',
          linkname: 'Link name',
          showHTML: 'Show HTML code'
        },
        colorPalette: {
          red: '#f44336',
          pink: '#e91e63',
          purple: '#9c27b0',
          deeppurple: '#673ab7',
          indigo: '#3f51b5',
          blue: '#2196f3',
          lightblue: '#03a9f4',
          cyan: '#00bcd4',
          teal: '#009688',
          green: '#4caf50',
          lightgreen: '#8bc34a',
          lime: '#cddc39',
          yellow: '#ffeb3b',
          amber: '#ffc107',
          orange: '#ff9800',
          deeporange: '#ff5722',
          brown: '#795548',
          grey: '#9e9e9e',
          bluegrey: '#607d8b',
          mdb: '#45526e',
          white: '#fff',
          black: '#000'
        }
      };
      this.$textarea = $(element);
      this.content = this.$textarea.val();
      this.uuid = this._randomUUID();
      this.options = this.assignOptions(options);
      this.colors = "";
      this.isCodeShown = false;
    }

    _createClass(WYSIWYG, [{
      key: "init",
      value: function init() {
        this.renderColorPalette();
        this.buildTemplate();
        this.bindEvents();
        $('[data-toggle="tooltip"]').tooltip();
      }
    }, {
      key: "assignOptions",
      value: function assignOptions(options) {
        return $.extend({}, this.defaults, options);
      }
    }, {
      key: "bindEvents",
      value: function bindEvents() {
        $(`#wysiwyg-${this.uuid}`).on('keyup change', this.updateNativeTextarea.bind(this));
        $(`#wysiwyg-container-${this.uuid} .mdb-wysiwyg-toolbar button[data-action]`).on('click', this.performAction.bind(this));
        $(`#wysiwyg-container-${this.uuid} .mdb-wysiwyg-toolbar [data-tagname]`).on('click', this.changeTagName.bind(this));
        $(`#wysiwyg-container-${this.uuid} .mdb-wysiwyg-toolbar-dropdown-toggle`).on('click', this.toggleOptionsList.bind(this));
        $(`#wysiwyg-container-${this.uuid} .mdb-wysiwyg-toolbar [data-color]`).on('click', this.setColor.bind(this));
        $(`#wysiwyg-container-${this.uuid} .mdb-wysiwyg-toolbar [data-action="insertlink"]`).on('click', this.insertLink.bind(this));
        $(`#wysiwyg-container-${this.uuid} .mdb-wysiwyg-toolbar [data-action="insertpicture"]`).on('click', this.insertPicture.bind(this));
        $(`#wysiwyg-container-${this.uuid} .mdb-wysiwyg-toolbar [data-action="toggleHTML"]`).on('click', this.toggleHTML.bind(this));
        $(`#wysiwyg-container-${this.uuid}.mdb-wysiwyg-container`).on('click', this.updateToolbar.bind(this));

        if (this.options.tooltips === true) {
          $('[data-tooltip]').tooltip({
            trigger: 'hover'
          });
        }
      }
    }, {
      key: "renderColorPalette",
      value: function renderColorPalette() {
        var _this = this;

        $.each(this.options.colorPalette, function (key, val) {
          _this.colors += `<li><button data-color=${val} style="background: ${val};></button></li>`;
        });
      }
    }, {
      key: "buildTemplate",
      value: function buildTemplate() {
        var template = `
        <div class="mdb-wysiwyg-container" id="wysiwyg-container-${this.uuid}">
          <div class="mdb-wysiwyg-toolbar">
            <div class="mdb-wysiwyg-toolbar-group">
              <div class="mdb-wysiwyg-toolbar-dropdown">
                <button class="mdb-wysiwyg-toolbar-dropdown-toggle">
                  ${this.options.translations.paragraph}
                </button>
                <ul class="mdb-wysiwyg-toolbar-options-list">
                  <li><a href="#" data-tagname="p">${this.options.translations.paragraph}</a></li>
                  <li><a href="#" data-tagname="h1">${this.options.translations.heading} 1</a></li>
                  <li><a href="#" data-tagname="h2">${this.options.translations.heading} 2</a></li>
                  <li><a href="#" data-tagname="h3">${this.options.translations.heading} 3</a></li>
                  <li><a href="#" data-tagname="h4">${this.options.translations.heading} 4</a></li>
                  <li><a href="#" data-tagname="h5">${this.options.translations.heading} 5</a></li>
                  <li><a href="#" data-tagname="h6">${this.options.translations.heading} 6</a></li>
                  <li><a href="#" data-tagname="pre">${this.options.translations.preformatted}</a></li>
                </ul>
              </div>
            </div>
            <div class="mdb-wysiwyg-toolbar-group">
              <ul class="mdb-wysiwyg-toolbar-options">
                <li><button data-action="bold" data-tooltip data-placement="bottom" title="${this.options.translations.bold}"><i class="fas fa-bold"></i></button></li>
                <li><button data-action="italic" data-tooltip data-placement="bottom" title="${this.options.translations.italic}"><i class="fas fa-italic"></i></button></li>
                <li><button data-action="strikethrough" data-tooltip data-placement="bottom" title="${this.options.translations.strikethrough}"><i class="fas fa-strikethrough"></i></button></li>
                <li><button data-action="underline" data-tooltip data-placement="bottom" title="${this.options.translations.underline}"><i class="fas fa-underline"></i></button></li>
                <li><button data-tooltip data-placement="bottom" title="${this.options.translations.textcolor}" class="mdb-wysiwyg-toolbar-dropdown-toggle"><i class="fas fa-font"></i></button><ul class="mdb-wysiwyg-toolbar-options-list mdb-wysiwyg-toolbar-color-palette">${this.colors}</ul></li>      
              </ul>
            </div>
            <div class="mdb-wysiwyg-toolbar-group">
              <ul class="mdb-wysiwyg-toolbar-options">
                <li><button data-action="justifyleft" data-tooltip data-placement="bottom" title="${this.options.translations.alignleft}"><i class="fas fa-align-left"></i></button></li>
                <li><button data-action="justifycenter" data-tooltip data-placement="bottom" title="${this.options.translations.aligncenter}"><i class="fas fa-align-center"></i></button></li>
                <li><button data-action="justifyright" data-tooltip data-placement="bottom" title="${this.options.translations.alignright}"><i class="fas fa-align-right"></i></button></li>
                <li><button data-action="justifyfull" data-tooltip data-placement="bottom" title="${this.options.translations.alignjustify}"><i class="fas fa-align-justify"></i></button></li>
              </ul>
            </div>            
            <div class="mdb-wysiwyg-toolbar-group">
              <ul class="mdb-wysiwyg-toolbar-options">
                <li><button data-action="insertlink" data-tooltip data-placement="bottom" title="${this.options.translations.insertlink}"><i class="fas fa-paperclip"></i></button></li>
                <li><button data-action="insertpicture" data-tooltip data-placement="bottom" title="${this.options.translations.insertpicture}"><i class="far fa-image"></i></button></li>
              </ul>
            </div>
            <div class="mdb-wysiwyg-toolbar-group">
              <ul class="mdb-wysiwyg-toolbar-options">
                <li><button data-action="insertUnorderedList" data-tooltip data-placement="bottom" title="${this.options.translations.bulletlist}"><i class="fas fa-list-ul"></i></button></li>
                <li><button data-action="insertOrderedList" data-tooltip data-placement="bottom" title="${this.options.translations.numberedlist}"><i class="fas fa-list-ol"></i></button></li>
              </ul>
            </div>
            <div class="mdb-wysiwyg-toolbar-group">
              <ul class="mdb-wysiwyg-toolbar-options">
                <li><button data-action="toggleHTML" data-tooltip data-placement="bottom" title="${this.options.translations.showHTML}"><i class="fas fa-code"></i></button></li>
              </ul>
            </div>
          </div>
          <div class="mdb-wysiwyg-textarea" contenteditable="true" id="wysiwyg-${this.uuid}">${this.content}</div>
        </div>
        `;

        this.$textarea.css({
          width: 0,
          height: 0,
          visibility: 'hidden'
        });
        this.$textarea.after(template);
      }
    }, {
      key: "updateToolbar",
      value: function updateToolbar() {

        if (this.isFocusOnIncorrectTextArea()) {
          return;
        }

        var buttons = $("#wysiwyg-".concat(this.uuid)).parent().find('.mdb-wysiwyg-toolbar [data-action]');
        $.each(buttons, function (key, val) {
          var action = $(val).data('action');
          document.queryCommandState(action) ? $(val).addClass('active') : $(val).removeClass('active');
        });
        var tagnames = $("#wysiwyg-".concat(this.uuid)).parent().find('.mdb-wysiwyg-toolbar [data-tagname]');
        $.each(tagnames, function (key, val) {
          var tag = $(val).data('tagname');

          if (document.queryCommandValue('formatBlock') === tag) {
            $(val).closest('.mdb-wysiwyg-toolbar-dropdown').find('button').text($(val).text());
          }
        });
      }
    }, {
      key: "isFocusOnIncorrectTextArea",
      value: function isFocusOnIncorrectTextArea() {
        const selectedElement = window.getSelection().anchorNode
        let selectedTextareaId = '';
        
        // if somethig is selected and if it is a .mdb-wysiwyg-textarea save id as selectedTextWysiwygID.
        if (selectedElement) {
          const selectedTextarea = selectedElement.parentElement.closest('.mdb-wysiwyg-textarea');

          if (selectedTextarea) {
            selectedTextareaId = selectedTextarea.id;
          }
        }

        if (Boolean(`wysiwyg-${this.uuid}` === selectedTextareaId)) {
          return false;
        } else {
          return true;
        }
      }
    }, {
      key: "insertLink",
      value: function insertLink(e) {
        e.preventDefault();

        if (this.isFocusOnIncorrectTextArea()) {
          return;
        }

        var url = prompt(this.options.translations.enterurl + ':', 'http://');
        var description = document.getSelection();

        if (url === null | url === 'http://') {
          return;
        }

        if (description.toString() === "") {
          description = prompt(this.options.translations.linkdescription + ':', this.options.translations.linkname);
        }

        document.execCommand('insertHTML', false, '<a href="' + url + '" target="_blank">' + description + '</a>');
      }
    }, {
      key: "insertPicture",
      value: function insertPicture(e) {
        e.preventDefault();

        if (this.isFocusOnIncorrectTextArea()) {
          return;
        }

        var url = prompt(this.options.translations.imageurl + ':', 'http://');

        if (url === null | url === 'http://') {
          return;
        }

        document.execCommand('insertHTML', false, '<img src="' + url + '" target="_blank" class="img-fluid" />');
      }
    }, {
      key: "performAction",
      value: function performAction(e) {
        e.preventDefault();

        if (this.isFocusOnIncorrectTextArea()) {
          return;
        }

        var $btn = $(e.target).closest('button');
        var action = $btn.data('action');

        document.execCommand(action, false, null);
      }
    }, {
      key: "changeTagName",
      value: function changeTagName(e) {
        e.preventDefault();

        if (this.isFocusOnIncorrectTextArea()) {
          return;
        }

        var $btn = $(e.target);
        document.execCommand('formatBlock', false, $btn.data('tagname'));
        $(e.target).closest('.mdb-wysiwyg-toolbar-options-list').removeClass('visible');
      }
    }, {
      key: "setColor",
      value: function setColor(e) {
        e.preventDefault();

        if (this.isFocusOnIncorrectTextArea()) {
          return;
        }
        
        var color = $(e.target).data('color');
        document.execCommand('styleWithCSS', false, true);
        document.execCommand('foreColor', false, color);
        $(e.target).closest('.mdb-wysiwyg-toolbar-options-list').removeClass('visible');
      }
    }, {
      key: "toggleOptionsList",
      value: function toggleOptionsList(e) {
        e.stopImmediatePropagation();
        e.preventDefault();
        $(e.target).parent().find('.mdb-wysiwyg-toolbar-options-list').toggleClass('visible');
        
        $(e.target).focusout(function(){
          $(e.target).parent().find('.mdb-wysiwyg-toolbar-options-list').removeClass('visible');
        });
      }
    }, {
      key: "updateNativeTextarea",
      value: function updateNativeTextarea() {

        if (this.isFocusOnIncorrectTextArea()) {
          return;
        }
        
        var newValue = $("#wysiwyg-".concat(this.uuid)).html();
        $(this.$textarea).val(newValue);
      }
    }, {
      key: "toggleHTML",
      value: function toggleHTML(e) {
        e.preventDefault();
        var $ref = $(e.target).closest('[data-action="toggleHTML"]');
        var $source = $("#wysiwyg-".concat(this.uuid));

        if (this.isCodeShown) {
          $source.html($source.text()).removeClass('show-raw');
          this.isCodeShown = false;
          $ref.removeClass('active');
        } else {
          $source.text($source.html()).addClass('show-raw');
          this.isCodeShown = true;
          $ref.addClass('active');
        }
      }
    }, {
      key: "_randomUUID",
      value: function _randomUUID() {
        var d = new Date().getTime();
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
          var r = (d + Math.random() * 16) % 16 | 0;
          d = Math.floor(d / 16);
          return (c === 'x' ? r : r & 0x3 | 0x8).toString(16);
        });
      }
    }]);

    return WYSIWYG;
  }();

  ;

  $.fn.mdbWYSIWYG = function (options) {
    var wysiwyg = new WYSIWYG($(this), options);
    wysiwyg.init();
  };
})(jQuery);
