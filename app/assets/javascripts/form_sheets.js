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
            }
        });
    }
    return {
        init: function() {
            _componentSortable();
        }
    }
}();

document.addEventListener('DOMContentLoaded', function() {
    CardsDraggable.init();
    // JqueryUiInteractions.init();
});
