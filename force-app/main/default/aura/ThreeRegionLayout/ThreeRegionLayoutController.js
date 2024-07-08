({
    afterRender: function (component, helper) {
        console.log('aaaaaaaa');
        this.superAfterRender();
        helper.initResizable(component);
    }
})