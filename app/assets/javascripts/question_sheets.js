var JqueryUiInteractions = function() {
// Selectable
    var _componentUiSelectable = function() {
        if (!$().selectable) {
            console.warn('Warning - jQuery UI components are not loaded.');
            return;
        }


        // Serialize
        $('#selectable-form-sheet').selectable({
            stop: function() {
                var result = $('#select-result').empty();
                $('.ui-selected', this).each(function() {
                    var index = $('#selectable-serialize li').index(this);
                    result.append(' #' + (index + 1));
                });
            }
        });
    };

    return {
        init: function() {
            // _componentUiDraggable();
            // _componentUiDroppable();
            // _componentUiResizable();
            _componentUiSelectable();
            // _componentUiSortable();
        }
    }
}();


var CardsDraggable = function(){
    let index_info = [];
    var _componentSortable = function() {
        if (!$().sortable) {
            console.warn('Warning - jquery_ui.js components are not loaded.');
            return;
        }

        // Sortable rows
        $('.row-sortable').sortable({
            connectWith: '.row-sortable',
            items: '.card',
            helper: 'original',
            cursor: 'move',
            handle: '[data-action=move]',
            revert: 100,
            containment: '.content-wrapper',
            forceHelperSize: true,
            placeholder: 'sortable-placeholder',
            forcePlaceholderSize: true,
            tolerance: 'pointer',
            start: function(e, ui){
                ui.placeholder.height(ui.item.outerHeight());
            },
            beforeStop: function( event, ui ) {
              index_info = $.map($(".sortable-card"),function(v,i){
                return [[$(v).data('question-id'),{ priority: i}]]
              })


              Rails.ajax({
                url: "/question_sheets/position",
                type: "patch",
                data: $.param({position: JSON.stringify(index_info)})
              })
            //$(".sortable-card").each(function(index) {
            //  console.log($(this), index, $(".sortable-card").length);
            // question_id =
            // Rails.ajax
            //});
            }
        });
    }
    return {
        init: function() {
            _componentSortable();
        }
    }
}();



// date time picker
var DateTimePickers = function() {
    // Daterange picker
    var _componentDaterange = function() {
        if (!$().daterangepicker) {
            console.warn('Warning - daterangepicker.js is not loaded.');
            return;
        }

        // Display time picker
        $('.daterange-time').daterangepicker({
            timePicker: true,
            applyClass: 'bg-slate-600',
            cancelClass: 'btn-light',
            locale: {
                format: 'MM/DD/YYYY h:mm a'
            }
        });

    };

    return {
        init: function() {
            _componentDaterange();
            // _componentPickadate();
            // _componentPickatime();
            // _componentAnytime();
        }
    }
}();



// date time picker end

document.addEventListener('DOMContentLoaded', function() {
    CardsDraggable.init();
    DateTimePickers.init();
    // JqueryUiInteractions.init();
});
