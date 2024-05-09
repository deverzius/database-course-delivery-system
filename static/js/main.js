var editSelect = document.getElementById("edit-select");

if (editSelect) {
    editSelect.onchange = function () {
        var selectedOption = this.options[this.selectedIndex];
        var selectedValue = selectedOption.value;

        window.location.href = `/apps/q31/edit/?id=${selectedValue}`;
    };
}

var delSelect = document.getElementById("del-select");

if (delSelect) {
    delSelect.onchange = function () {
        var selectedOption = this.options[this.selectedIndex];
        var selectedValue = selectedOption.value;

        window.location.href = `/apps/q31/del/?id=${selectedValue}`;
    };
}
