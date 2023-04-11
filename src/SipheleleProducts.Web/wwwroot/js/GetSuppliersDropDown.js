Vue.component('v-select', VueSelect.VueSelect);

var categoriesToDisplay = new Vue({
    el: '#appFilterSuppliers',
    data: {
        options: GetAllActiveSuppliers()
    },
    methods: {
        changeHandler(supplier) {

            if (supplier) {
                document.getElementById("addNewProductViewModel_SupplierId").value = supplier.id;
            } else {
                $('#addNewProductViewModel_SupplierId').val(null);
            }
        }
    },
    render: function render(h) {
        return h("v-select", {
            "on": {
                "input": this.changeHandler
            },
            "attrs": {
                "multiple": false,
                "options": this.options,
                "item-value": this.options,
                "item-text": this.options,
                "placeholder": "--- Please Select Supplier ---"
            }
        });
    }
});

function GetAllActiveSuppliers() {
    let data = [];
    window.axios.get('/api/app/suppliers/suppliers').then(function (response) {
        for (let i = 0; i < response.data.length; i++) {
            data.push({
                id: response.data[i].supplierId,
                label: response.data[i].companyName
            });
        }
    });

    return data;
}  