({
    initResizable: function (component) {
        let resizableDividers = component.find("resizableDivider");
		console.log('ffffffffff');
        for (let i = 0; i < resizableDividers.length; i++) {
            let divider = resizableDividers[i];
            this.initializeDivider(divider, i);
        }
    },

    initializeDivider: function (divider, index) {
        console.log('dddddddddd');
        divider.getElement().addEventListener("mousedown", function (e) {
            this.startResizing(e, divider, index);
        }.bind(this));
    },

    startResizing: function (e, divider, index) {
        console.log('ssssssss');
        e.preventDefault();
        window.addEventListener("mousemove", this.resize.bind(this, divider, index));
        window.addEventListener("mouseup", this.stopResizing.bind(this));
    },

    resize: function (divider, index, e) {
        console.log('aaaaaaaa');
        let container = divider.getParent();
        let sections = container.find("resizableSection");
        let width = e.clientX - container.getElement().getBoundingClientRect().left;

        sections[index].getElement().style.width = width + "px";
        sections[index + 1].getElement().style.width = (container.getElement().clientWidth - width - 10) + "px"; // 10 is the divider width
    },

    stopResizing: function () {
        console.log('qqqqqqq');
        window.removeEventListener("mousemove", this.resize);
        window.removeEventListener("mouseup", this.stopResizing);
    }
})