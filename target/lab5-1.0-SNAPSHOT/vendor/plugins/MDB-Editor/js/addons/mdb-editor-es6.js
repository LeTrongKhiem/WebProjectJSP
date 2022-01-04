/*
 * MDBootstrap Table Editor
 * Learn more:  https://mdbootstrap.com/plugins/jquery/table-editor/,
 * https://mdbootstrap.com/docs/jquery/tables/datatables/
 *
 * About MDBootstrap: https://mdbootstrap.com/
 * Support: https://mdbootstrap.com/support/
 * Contact: https://mdbootstrap.com/contact/
 *
 * This file was created by MDBootstrap Developer Team
 * This component based on DataTable 1.10.18 with MIT version
 *
 * Used libraries:
 *   DataTables 1.10.18
 */

/*! DataTables 1.10.18
 * ©2008-2019 SpryMedia Ltd - datatables.net/license
 *
 */

($ => {

  $.fn.mdbEditor = function (options) {

    const addSomeClasses = (e, classes) => e.addClass(classes),
      defaultsFx = (e, type, element, property) => {
        $(e).find(`table ${type}`).css(element, property);
      },

      defaults = {
        headerLength: 6,
        evenTextColor: '#000',
        oddTextColor: '#000',
        bgEvenColor: '',
        bgOddColor: '',
        thText: '',
        thBg: '',
        modalEditor: false,
        bubbleEditor: false,
        contentEditor: false,
        rowEditor: false,
        bubblePositionX: 80,
        bubblePositionY: 0
      };

    options = $.extend(defaults, options);

    return this.map((i, e) => {

      const $tableId = $(`#${$(e).closest('.wrapper-editor').find('table tbody').parent().attr('id')}`),
        $DataTable = $tableId.DataTable(),
        $wrapperEditor = $tableId.closest('.wrapper-editor'),
        editorOptions = {
          headerLength: options.headerLength,
          evenTextColor: options.evenTextColor,
          oddTextColor: options.oddTextColor,
          bgEvenColor: options.bgEvenColor,
          bgOddColor: options.bgOddColor,
          thText: options.thText,
          thBg: options.thBg,
          modalEditor: options.modalEditor,
          rowEditor: options.rowEditor,
          bubbleEditor: options.bubbleEditor,
          contentEditor: options.contentEditor,
          bubblePositionX: options.bubblePositionX,
          bubblePositionY: options.bubblePositionY
        };

      const startedStyleFunction = () => {
        defaultsFx($wrapperEditor, 'tr.even', 'color', [...editorOptions.evenTextColor].join(''));
        defaultsFx($wrapperEditor, 'tr.odd', 'color', [...editorOptions.oddTextColor].join(''));
        defaultsFx($wrapperEditor, 'tr.even', 'background-color', [...editorOptions.bgEvenColor].join(''));
        defaultsFx($wrapperEditor, 'tr.odd', 'background-color', [...editorOptions.bgOddColor].join(''));
        defaultsFx($wrapperEditor, 'th', 'color', [...editorOptions.thText].join(''));
        defaultsFx($wrapperEditor, 'th', 'background-color', [...editorOptions.thBg].join(''));
      }

      const sortingTable = () => {
        startedStyleFunction();
      }

      startedStyleFunction();

      $wrapperEditor.find('table th, .dataTables_paginate').on('click', sortingTable);

      if (options.modalEditor === true) {

        let $selectedRow,
          $createShowP = $wrapperEditor.find('.createShowP'),
          $buttonEdit = $wrapperEditor.find('.buttonEdit'),
          $buttonDelete = $wrapperEditor.find('.buttonDelete'),
          $buttonAddFormWrapper = $wrapperEditor.find('.buttonAddFormWrapper'),
          $buttonEditWrapper = $wrapperEditor.find('.buttonEditWrapper'),
          $editInsideWrapper = $wrapperEditor.find('.editInsideWrapper'),
          $deleteButtonsWrapper = $wrapperEditor.find('.deleteButtonsWrapper'),
          editInside = $wrapperEditor.find('.editInside'),
          trColorSelected = '.tr-color-selected';

        const addNewRows = () => {

            let $newRow = [];

            for (let i = 0; i < editorOptions.headerLength; i++) {

              $newRow.push($wrapperEditor.find('.addNewInputs input').eq(i).val());
            }

            $DataTable.row.add($newRow).draw();
          },

          btnToModalAdd = () => {

            $wrapperEditor.find('.addNewInputs input').removeClass('valid').val('');
            $wrapperEditor.find('.addNewInputs label').removeClass('active');
          },

          addColorToTr = e => $(e.target).parent().not('thead tr').not('tfoot tr').toggleClass('tr-color-selected').siblings().removeClass('tr-color-selected'),

          toggleDisabledToButtons = e => {

            $selectedRow = $(e.target).parent();

            if ($(e.target).parent().not('thead tr').not('tfoot tr').hasClass('tr-color-selected')) {

              $buttonEdit.prop('disabled', false);
              $buttonDelete.prop('disabled', false);
              $createShowP.html('1 row selected');
            } else if (!$('tr').hasClass('tr-color-selected')) {

              $buttonEdit.prop('disabled', true);
              $buttonDelete.prop('disabled', true);
              $createShowP.html('0 row selected');
            }
          },

          buttonEditInput = () => {

            for (let i = 0; i < editorOptions.headerLength; i++) {

              $DataTable.row($wrapperEditor.find('.modalEditClass input').eq(i).val($DataTable.cell($selectedRow, i).data()));
            }
          },

          addClassActiveToLabel = () => {

            for (let i = 0; i < editorOptions.headerLength; i++) {

              if ($wrapperEditor.find('.modalEditClass input').eq(i).val() !== '') {

                $wrapperEditor.find('.modalEditClass label').eq(i).addClass('active');
              }
            }
          },

          buttonEditInside = () => {

            for (let i = 0; i < editorOptions.headerLength; i++) {

              $DataTable.cell($(trColorSelected).find('td').eq(i)).data($wrapperEditor.find('.modalEditClass input').eq(i).val());
            }
          },

          removeColorClassFromTr = () => $wrapperEditor.find('.tr-color-selected').removeClass('tr-color-selected'),

          disabledButtons = () => {

            $buttonEdit.prop('disabled', true);
            $buttonDelete.prop('disabled', true);
          },

          selectedZeroRowsNews = () => {

            $createShowP.html('0 row selected');
            $DataTable.draw(false);
          },

          buttonDeleteYes = () => {

            $buttonEdit.prop('disabled', true);
            $buttonDelete.prop('disabled', true);
            $createShowP.html('0 row selected');
            $DataTable.row($(trColorSelected)).remove().draw();
          },

          bindEvents = () => {

            $buttonAddFormWrapper.on('click', '.buttonAdd', addNewRows);
            $wrapperEditor.on('click', 'tr', addColorToTr);
            $wrapperEditor.on('click', 'tr', toggleDisabledToButtons);
            $buttonEditWrapper.on('click', $buttonEdit, buttonEditInput);
            $buttonEditWrapper.on('click', $buttonEdit, addClassActiveToLabel);
            $deleteButtonsWrapper.on('click', '.btnYesClass', buttonDeleteYes);
            $editInsideWrapper.on('click', editInside, buttonEditInside);
            $editInsideWrapper.on('click', editInside, removeColorClassFromTr);
            $editInsideWrapper.on('click', editInside, disabledButtons);
            $editInsideWrapper.on('click', editInside, selectedZeroRowsNews);
            $('.wrapperToBtnModalAdd').on('click', '.btnToModalAdd', btnToModalAdd);
          };

        $wrapperEditor.find('.modalEditClass').on('keypress', e => {

          if (e.which === 13) {

            buttonEditInside(editInside);
            $(editInside).trigger('click');
            removeColorClassFromTr();
            disabledButtons();
            selectedZeroRowsNews();
          }
        });

        $wrapperEditor.find('.addNewInputs').on('keypress', e => {

          if (e.which === 13) {
            $('.buttonAdd').click();
          }
        });

        $wrapperEditor.find('.modalDeleteTarget').on('keypress', e => {

          if (e.which === 13) {
            $('.btnYesClass').click();
          }
        });

        bindEvents();
      }

      if (options.rowEditor === true) {

        let editRow = '.editRow',
          saveRow = '.saveRow',
          tdLast = 'td:last',
          $removeColumns = $('.removeColumns'),
          addNewColumn = '.addNewColumn',
          $buttonWrapper = $('.buttons-wrapper'),
          $closeByClick = $('.closeByClick'),
          $showForm = $('.showForm');

        $wrapperEditor.find('.buttons-wrapper button').prop('disabled', false);

        const addNewTr = e => {

            $(e.target).parents().eq(1).map((i, event) => {

              $(event).find('tr').map((i, ev) => {

                $(ev).find(tdLast).not('.td-editor').after('<td class="text-center td-editor" style="border-top: 1px solid #dee2e6; border-bottom:1px solid #dee2e6"><button class="btn btn-sm editRow btn-sm btn-teal"><i class="far fa-edit"></i></button></td>');
              });
            });
          },
          removeDisabledButtons = () => {

            let $removeColumns = $wrapperEditor.find('.removeColumns');

            if ($wrapperEditor.find('td').hasClass('td-editor')) {

              $removeColumns.prop('disabled', false);
            }
          },

          editRowAndAddClassToTr = e => {

            let $closestTrTd = $(e.target).closest('.wrapper-editor tr').find('td'),
              $closestTrEdit = $(e.target).closest('.wrapper-editor tr').find(editRow),
              divWrapper = '<div class="d-flex justify-content-center div-to-remove"></div>',
              editButton = '<td class="text-center td-editor td-yes" style="border:none"><button class="btn btn-sm btn-danger deleteRow" style="cursor:pointer;"><i class="fas fa-trash-alt"></i></b></td>',
              saveButton = '<td class="text-center td-editor td-yes" style="border:none"><button class="btn btn-sm btn-primary saveRow" style="cursor:pointer;"><i class="fas fa-check"></i></button></td>';

            for (let i = 0; i < editorOptions.headerLength; i++) {

              $closestTrTd.eq(i).html(`<input type="text" class="val${i} form-control" value="${$closestTrTd.eq(i).text()}">`);
            }
            $closestTrEdit.after($(divWrapper).append(saveButton, editButton));

            $wrapperEditor.on('click', '.deleteRow', () => {

              $wrapperEditor.find('.showForm, .closeByClick').removeClass('d-none');
            });
          },

          clickBtnCBCaddDnone = e => {

            addSomeClasses($(e.target), 'd-none');
            addSomeClasses($showForm, 'd-none');
          },

          addDnoneByClickBtns = () => {

            addSomeClasses($closeByClick, 'd-none');
            addSomeClasses($showForm, 'd-none');
          },

          addColorClassAndPy = e => {

            let $closestTr = $(e.target).closest('tr');

            addSomeClasses($closestTr, 'tr-color-selected')
            addSomeClasses($closestTr.find('td').not('.td-editor'), 'py-5')
          },

          addDisabledButtonsByEditBtn = e => {

            $(e.target).prop('disabled', true);
            $(e.target).closest('.wrapper-editor').find($removeColumns).prop('disabled', true);
          },

          saveRowAndRemovePy = e => {

            let $closestTr = $(e.target).closest('tr');

            for (let i = 0; i < editorOptions.headerLength; i++) {

              $DataTable.cell($closestTr.find('td').eq(i)).data($closestTr.find('.val' + i).val());
            }

            $closestTr.find('td').removeClass('py-5');
          },

          removeDisabledColorAdnTdYes = e => {

            let $closestTr = $(e.target).closest('tr');

            $closestTr.find(editRow).prop('disabled', false);
            $closestTr.removeClass('tr-color-selected');
            $closestTr.find('.td-yes').remove();
            $DataTable.draw(false);
            if (!$wrapperEditor.find('tbody tr').hasClass('tr-color-selected')) $wrapperEditor.find('.removeColumns').prop('disabled', false);
          },

          saveRowClickRemoveDiv = function () {

            $(this).find('.div-to-remove').remove()
          },

          removeColorInTrAndDraw = () => {

            $DataTable.row($wrapperEditor.find('tr.tr-color-selected')).remove().draw(false);

            if (!$wrapperEditor.find('tbody tr').hasClass('tr-color-selected')) {

              $wrapperEditor.find($removeColumns).prop('disabled', false);
            } else {

              $wrapperEditor.find($removeColumns).prop('disabled', true);
            }
          },

          removeSelectedButtonsFromRow = () => {

            if ($wrapperEditor.find('tbody tr').hasClass('tr-color-selected')) {

              $wrapperEditor.find('.removeColumns').attr('disabled', true);
              return false;
            } else {

              $wrapperEditor.find('.td-editor').remove();
              $wrapperEditor.find('.tr-color-selected').remove();
              $DataTable.draw(false);
            }
          },

          bindEvents = () => {

            $buttonWrapper.on('click', addNewColumn, addNewTr);
            $buttonWrapper.on('click', addNewColumn, removeDisabledButtons);
            $wrapperEditor.on('click', editRow, editRowAndAddClassToTr);
            $wrapperEditor.on('click', editRow, addColorClassAndPy);
            $wrapperEditor.on('click', editRow, addDisabledButtonsByEditBtn);
            $wrapperEditor.on('click', saveRow, saveRowAndRemovePy);
            $wrapperEditor.on('click', saveRow, removeDisabledColorAdnTdYes);
            $wrapperEditor.on('click', saveRow, saveRowClickRemoveDiv);
            $('.buttonYesNoWrapper').on('click', '.btnYes', removeColorInTrAndDraw);
            $buttonWrapper.on('click', '.removeColumns', removeSelectedButtonsFromRow);
            $showForm.on('click', '.btnYes, .button-x, .btnNo', addDnoneByClickBtns);
            $closeByClick.on('click', clickBtnCBCaddDnone);
          }

        bindEvents();

        if ($closeByClick.hasClass('d-none') === true) {

          $(document).keyup(e => {

            if (e.keyCode === 27) {

              addSomeClasses($closeByClick, 'd-none');
              addSomeClasses($showForm, 'd-none');
            }
          });
        }

        $wrapperEditor.find('.buttons-wrapper').on('click', '.addNewRows', e => {

          let $newRow = [];

          for (let i = 0; i < editorOptions.headerLength; i++) {

            $newRow.push($(e.target).val());
          }

          $(`#${$(e.target).closest('.wrapper-editor').find('table').attr('id')}`).DataTable().row.add($newRow).draw();
        });
      }

      if (options.contentEditor === true) {

        $wrapperEditor.find('table tbody').addClass('disabled-table');

        const toggleBtnAndInputs = function () {

            $wrapperEditor.find('tbody').toggleClass('disabled-table');
            $(this).find('.fa-toggle-off').toggleClass('fa-toggle-on');

            if ($wrapperEditor.find('table tbody').hasClass('disabled-table')) {

              $wrapperEditor.find('input').prop('disabled', true);
            } else {

              $wrapperEditor.find('input').prop('disabled', false);
            }
          },

          clickOnTd = function (ev) {

            const focusInput = e => $(e).focus(),
              $this = $(this),
              $eTarget = $(ev.target),
              $dtHeadTitle = $($wrapperEditor.find('thead th')[$DataTable.cell($this).index().column]).text().replace(/\s/g, '').toLowerCase();

            if (`${$dtHeadTitle}`.includes('date') && !$this.children().hasClass('mdb-content-dynamic-input')) {

              $this.html(`<input type='date' class='form-control mdb-content-dynamic-input' value='${$this.text()}'/> <span class='d-none dynamic-span'>${$this.text()}</span>`);
              focusInput('.mdb-content-dynamic-input');
            } else if (!$this.children().hasClass('mdb-content-dynamic-input')) {

              $this.html(`<input type='text' class='form-control mdb-content-dynamic-input' value='${$this.text()}'/> <span class='d-none dynamic-span'>${$this.text()}</span>`);
              focusInput('.mdb-content-dynamic-input');
            }

            if ($wrapperEditor.find('td').children().length > 2) {

              let $dtData = $wrapperEditor.find('.mdb-content-dynamic-input').parent().not($eTarget).html($wrapperEditor.find('.mdb-content-dynamic-input').not($eTarget.children()).val());
              $DataTable.cell($dtData).data($dtData.text()).draw();
              focusInput('.mdb-content-dynamic-input');
            }
          },

          keyupEvents = ev => {

            const $evTarget = $(ev.target);

            if (ev.which === 13) {

              $DataTable.cell($evTarget.parent()).data($evTarget.val()).draw(true);
            }

            if (ev.which === 27) {

              $DataTable.cell($evTarget.parent()).data($evTarget.next().text()).draw(true);
            }
          },

          saveTdWhenSorting = function () {

            let $DataTableNodeTd = $DataTable.column($(this)).nodes();

            for (let i = 0; i < $DataTableNodeTd.length; i++) {

              if ($($DataTableNodeTd[i]).children().length > 1) {

                $DataTable.cell($DataTableNodeTd[i]).data($($DataTableNodeTd[i]).children().closest('.mdb-content-dynamic-input').val()).draw(true);
              }
            }
          },

          addNewRows = () => {

            let $newRow = [];

            for (let i = 0; i < options.headerLength; i++) {

              $newRow.push($wrapperEditor.find('thead th').eq(i).val());
            }

            if ($wrapperEditor.find('tbody td').hasClass('disabled-table')) {

              $($DataTable.row.add($newRow).draw(true).nodes()).children().addClass('disabled-table');
            } else {

              $DataTable.row.add($newRow).draw(true);
            }
          },

          removeFirstRowOrSelected = () => {

            if ($wrapperEditor.find('.mdb-content-dynamic-input').length > 0) {

              $DataTable.row($($wrapperEditor.find('.mdb-content-dynamic-input').parents().eq(1))).remove().draw(true);
            } else {

              $DataTable.row().remove().draw(true);
            }
          },

          bindEvents = () => {

            $wrapperEditor.find('.buttons-wrapper').on('click', '.add-content-edit', toggleBtnAndInputs);
            $wrapperEditor.find('table').not('thead, tfoot').on('click', 'td', clickOnTd);
            $wrapperEditor.not('thead, tfoot').on('keyup click', '.mdb-content-dynamic-input', keyupEvents);
            $wrapperEditor.find('.buttons-wrapper').on('click', '.remove-first-tr', removeFirstRowOrSelected);
            $wrapperEditor.find('.buttons-wrapper').on('click', '.add-new-row', addNewRows);
            $wrapperEditor.on('click', 'thead th', saveTdWhenSorting);
          }

        bindEvents();
      }

      if (options.bubbleEditor === true) {

        $wrapperEditor.find('.buttons-wrapper button').prop('disabled', false);

        let nth = ['', 'Second ', 'Third ', 'Fourth ', 'Fifth ', 'Sixth ', 'Seventh ', 'Eighth', 'Ninth ', 'Tenth ', 'Eleventh ', 'Twelth ', 'Thirteen ', 'Fourteenth ', 'Fifteenth ', 'Sixteenth', 'Seventeenth', 'Eighteenth', 'Nineteenth'];
        let $bubbleMainDiv = $('<div>', {
          class: 'm-3 bubble-main d-flex-not-important flex-column'
        });
        let $document = $(document);

        const inWords = num => {

          if ((num = num.toString()).length > 9) return 'overflow';
          let n = ('000000000' + num).substr(-9).match(/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
          if (!n) return;
          let str = '';
          str += n[5] != 0 ? (str != '' ? 'and ' : '') + (nth[Number(n[5])] || [n[5][0]] + ' ' + nth[n[5][1]]) : '';
          return str;
        };

        $wrapperEditor.find('.buttons-wrapper').on('click', '.add-bubble-edit', function () {

          let $this = $(this);

          if ($this.children().hasClass('fa-toggle-off')) {

            $this.not('.fas').html('<i class="fas fa-toggle-on ml-1"></i>');
            $wrapperEditor.find('table tbody').removeClass('disabled-table');
            $wrapperEditor.find('table td').addClass('bubble-td-cursor');

            $wrapperEditor.find('table').not('thead, tfoot').on('click', 'td', ev => {

              let $evTarget = $(ev.target),
                $dtHeadColumText = $($wrapperEditor.find('table thead th')[$DataTable.cell($evTarget).index().column]).text().replace(/\s/g, ''),
                bubbleMainClass = 'm-3 p-2 d-flex-not-important justify-content-center flex-column text-left bubble-inside',
                btnUpadteWithWrapper = `<div class='wrapper-btn-bubble-update text-center'><button class='btn btn-sm btn-rounded btn-primary mt-3 btn-bubble-update'>Update <i class='ml-1 far fa-edit'></i></button><button class='btn btn-sm btn-rounded btn-danger mt-3 btn-bubble-clear'>Clear <i class="fas fa-eraser"></i></button></div>`,
                labelWithColumText = `<label>${$dtHeadColumText}:</label>`;

              if ($evTarget.html().match(/^\s*\d[\d,\.]*\s*$/)) {

                $bubbleMainDiv.html($('<div>', {
                  class: bubbleMainClass,
                  html: `${labelWithColumText}<input type='number' class='text-left form-control' value='${$evTarget.text()}'> ${btnUpadteWithWrapper}`
                }));
              } else if (`'${$dtHeadColumText.toLowerCase()}'`.includes('date')) {

                $bubbleMainDiv.html($('<div>', {
                  class: bubbleMainClass,
                  html: `${labelWithColumText}<input type='date' class='text-left form-control' value='${$evTarget.text()}'> ${btnUpadteWithWrapper}`
                }));
              } else if (`'${$dtHeadColumText.toLowerCase()}'`.includes('name') && $evTarget.text().split(' ').length >= 1) {

                let $divToMainClass = $(`<div class='${bubbleMainClass}'></div>`);

                for (let i = 0; i < $evTarget.text().split(' ').length; i++) {

                  $($bubbleMainDiv.html($divToMainClass.append(`<div class='d-flex flex-column wrapper-bubble-label-input'><label class='mt-2 mb-1'>${inWords(i)} ${$dtHeadColumText}:</label><div class='d-flex'><input type='text' class='text-left form-control' value='${$evTarget.text().split(' ').filter(i => i).splice(i, 1).toString()}'><span class='ml-2 wrapper-bubble-input-delete d-flex'><i class='fas fa-plus-circle blue-text bubble-input-add-icon mt-2 mr-1'></i><i class='fas fa-minus-circle red-text bubble-input-delete-icon mt-2'></i></span></div></div>`))).appendTo(btnUpadteWithWrapper);
                  $('.bubble-inside').append(btnUpadteWithWrapper);
                }

                $bubbleMainDiv.find('label:last').html(`Last ${$dtHeadColumText}:`);
                $bubbleMainDiv.find('label:first').html(`First ${$dtHeadColumText}:`);
                $divToMainClass.append(btnUpadteWithWrapper);
              } else {

                $bubbleMainDiv.html($('<div>', {
                  class: bubbleMainClass,
                  html: `<label>${$dtHeadColumText}:</label><input type='text' class='text-left form-control' value='${$evTarget.text()}'> ${btnUpadteWithWrapper}`
                }));
              }

              $('<div class ="bubble-bg"></div>').appendTo('body');
              $('<div class ="bubble-arrow"></div>').prependTo($wrapperEditor);
              $('<span class="text-right position-absolute bubble-span-close" style="top:-8px; right:-8px;"><i class="fas fa-times-circle"></i></span>').prependTo($('<button type="button" class="close text-right bubble-button-x"></button>').prependTo($bubbleMainDiv.prependTo($wrapperEditor)));

              let $wrapperBtnBubbleUpdate = $('.wrapper-btn-bubble-update'),
                $wrapperBubbleInputDelete = $('.wrapper-bubble-input-delete'),
                $bubbleBg = $('.bubble-bg'),
                $bubbleMain = $('.bubble-main'),
                $bubbleArrow = $('.bubble-arrow');

              $evTarget.addClass('tr-color-selected');
              $bubbleMain.css({
                top: ev.pageY - options.bubblePositionX,
                left: ev.pageX - options.bubblePositionY
              });

              if ($document.find('.bubble-bg').length > 1) $bubbleBg.not(':last').remove();
              if ($wrapperEditor.find('.bubble-arrow').length > 1) $bubbleArrow.not(':last').remove();

              const removeBubbleDarkBg = e => $(e.target).remove(),
                removeArrowAndMain = () => $('.bubble-main, .bubble-arrow').remove(),
                removeColorClassFromTd = () => $evTarget.removeClass('tr-color-selected'),
                takeDataTdIfHasColor = e => {

                  let $eTarget = $(e.target);

                  if ($evTarget.hasClass('tr-color-selected') && `${$dtHeadColumText.toLowerCase()}`.includes('name')) {

                    let $new = [],
                      $eventInputs = $eTarget.parent().parent().find('input');

                    for (let i = 0; i < $eventInputs.length; i++) {

                      $new.push($eventInputs.eq(i).val());
                    }
                    $DataTable.cell($evTarget).data($new.toString().split(',').filter(i => i).join(' ')).draw();
                  } else if ($evTarget.hasClass('tr-color-selected')) {

                    $DataTable.cell($evTarget).data($eTarget.parent().prev().val()).draw();
                  }
                },
                findBubbleBgAddRemove = () => $document.find('.bubble-bg').remove(),
                btnUpdateRemoveArrowMain = () => removeArrowAndMain(),
                removeColorFromTr = () => removeColorClassFromTd(),
                bubbleSpanRemove = () => {

                  removeArrowAndMain();
                  removeColorClassFromTd();
                  findBubbleBgAddRemove();
                },
                btnClearInputs = e => $(e.target).parents().eq(1).find('input').val(''),
                keyupEvents = e => {

                  if (e.keyCode === 27) {

                    removeArrowAndMain();
                    removeColorClassFromTd();
                    findBubbleBgAddRemove();
                  }

                  if (e.keyCode === 13) {

                    $wrapperEditor.find('.btn-bubble-update').click();
                  }
                },
                deleteClosestInputLabel = e => {

                  if ($wrapperEditor.find('.bubble-inside input').length > 1) $(e.target).closest('.wrapper-bubble-label-input').remove();
                  if ($wrapperEditor.find('.wrapper-bubble-input-delete').first().children().length < 2) $wrapperEditor.find('.wrapper-bubble-input-delete').first().prepend(`<i class='fas fa-plus-circle blue-text bubble-input-add-icon mt-2 mr-1'></i>`);
                },
                addNewInput = e => {

                  let $eTarget = $(e.target),
                    $clondeDiv = $eTarget.parents().eq(2).clone(true);

                  $clondeDiv.insertAfter($eTarget.parents().eq(2));
                  $clondeDiv.addClass('cloned');
                  $clondeDiv.find('label').html('New Input:');
                  $clondeDiv.find('input').val('');
                  $clondeDiv.find('.wrapper-bubble-input-delete .fa-plus-circle').remove();
                },
                bindTdEvents = () => {

                  $bubbleBg.on('click', removeBubbleDarkBg);
                  $bubbleBg.on('click', removeArrowAndMain);
                  $bubbleBg.on('click', removeColorClassFromTd);
                  $wrapperBtnBubbleUpdate.on('click', '.btn-bubble-update', takeDataTdIfHasColor);
                  $wrapperBtnBubbleUpdate.on('click', '.btn-bubble-update', findBubbleBgAddRemove);
                  $wrapperBtnBubbleUpdate.on('click', '.btn-bubble-update', btnUpdateRemoveArrowMain);
                  $wrapperBtnBubbleUpdate.on('click', '.btn-bubble-update', removeColorFromTr);
                  $wrapperBtnBubbleUpdate.on('click', '.btn-bubble-clear', btnClearInputs);
                  $('.bubble-button-x').on('click', '.bubble-span-close', bubbleSpanRemove);
                  $wrapperBubbleInputDelete.on('click', '.bubble-input-add-icon', addNewInput);
                  $wrapperBubbleInputDelete.on('click', '.bubble-input-delete-icon', deleteClosestInputLabel);
                  $document.on('keyup', keyupEvents);
                };

              bindTdEvents();

            });
          } else {

            $this.not('.fas').html('<i class="fas fa-toggle-off ml-1"></i>');
            $wrapperEditor.find('table tbody').addClass('disabled-table');
            $wrapperEditor.find('table td').not('thead, tfoot').removeClass('bubble-td-cursor');
          }
        });

        const addNewRows = () => {

            let $newRow = [];

            for (let i = 0; i < editorOptions.headerLength; i++) {

              $newRow.push($wrapperEditor.find('table thead th').eq(i).val());
            }

            $DataTable.row.add($newRow).draw(true);
          },
          removeFirstTr = () => $DataTable.row().remove().draw(true);

        $wrapperEditor.find('.buttons-wrapper').on('click', '.removeFirstTr', removeFirstTr);
        $wrapperEditor.find('.buttons-wrapper').on('click', '.addNewRow', addNewRows);
      }
    });
  };
})(jQuery);
