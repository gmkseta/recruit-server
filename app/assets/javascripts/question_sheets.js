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



// Setup module
// ------------------------------

var Scrollspy = function () {


    //
    // Setup module components
    //

	// Sticky
    var _componentSticky = function() {
        if (!$().stick_in_parent) {
            console.warn('Warning - sticky.min.js is not loaded.');
            return;
        }

        // Initialize
        $('.sidebar-sticky .sidebar').stick_in_parent({
            offset_top: 20,
            parent: '.content'
        });

        // Detach on mobiles
        $('.sidebar-mobile-component-toggle').on('click', function() {
            console.log("asd")
            $('.sidebar-sticky .sidebar').trigger("sticky_kit:detach");
        });
    };


    //
    // Return objects assigned to module
    //

    return {
        initComponents: function() {
            _componentSticky();
        }
    }
}();


// date time picker end

document.addEventListener('DOMContentLoaded', function() {
    CardsDraggable.init();
    DateTimePickers.init();
    Scrollspy.initComponents();
    // JqueryUiInteractions.init();
});
