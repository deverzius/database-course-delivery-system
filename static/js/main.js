let editSelect = document.getElementById("edit-select");

if (editSelect) {
    editSelect.onchange = function () {
        let selectedOption = this.options[this.selectedIndex];
        let selectedValue = selectedOption.value;

        window.location.href = `/apps/q31/edit/?id=${selectedValue}`;
    };
}

let delSelect = document.getElementById("del-select");

if (delSelect) {
    delSelect.onchange = function () {
        let selectedOption = this.options[this.selectedIndex];
        let selectedValue = selectedOption.value;

        window.location.href = `/apps/q31/del/?id=${selectedValue}`;
    };
}

let monthSelect = document.getElementById("month-select");
let yearSelect = document.getElementById("year-select");

if (monthSelect && yearSelect) {
    monthSelect.onchange = function () {
        let selectedOption = this.options[this.selectedIndex];
        let selectedValue = selectedOption.value;

        const params = new URLSearchParams(window.location.search);
        params.set("month", selectedValue);
        window.location.search = params.toString();
    };

    yearSelect.onchange = function () {
        let selectedOption = this.options[this.selectedIndex];
        let selectedValue = selectedOption.value;

        const params = new URLSearchParams(window.location.search);
        params.set("year", selectedValue);
        window.location.search = params.toString();
    };
}

let sortSelect = document.getElementById("sort-select");
if (sortSelect) {
    sortSelect.onchange = function (e) {
        let selectedOption = this.options[this.selectedIndex];
        let selectedValue = selectedOption.value;

        const params = new URLSearchParams(window.location.search);
        params.set("sort", selectedValue);
        window.location.search = params.toString();
    };
}

let sortToggle = document.getElementById("sort-toggle");
if (sortToggle) {
    sortToggle.onclick = function (e) {
        const params = new URLSearchParams(window.location.search);
		const val = params.get("desc");
		if (val)
		{
			params.delete("desc");
		}
		else
		{
			params.set("desc", "1");
		}
        window.location.search = params.toString();
    };
}

let searchBar = document.getElementById("search-bar");
if (searchBar) {
	searchBar.onkeydown = function (e) {
		if (e.key === "Enter")
		{
			const params = new URLSearchParams(window.location.search);
			params.set("search", this.value);
			window.location.search = params.toString();
		}
	};
}

let whereInput = document.getElementById("where-input");
if (whereInput) {
    whereInput.onkeydown = function (e) {
        if (e.key === "Enter")
        {
            const params = new URLSearchParams(window.location.search);
            params.set("where", this.value);
            window.location.search = params.toString();
        }
    };
}