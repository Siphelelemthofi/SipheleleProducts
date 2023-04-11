Vue.component('v-select', VueSelect.VueSelect);

var categoriesToDisplay = new Vue({
    el: '#updatecategoriesDisplay',
    data: {
        options: GetAllActiveCategories()
    },
    methods: {

        changeHandler(category) {

            if (category) {
                document.getElementById("updateProductViewModel_CategoryId").value = category.id;
                $('#updateProductViewModel_CategoryId').val(category.id);
            } else {
                $('#updateProductViewModel_CategoryId').val(category.label);
          
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
                "placeholder": "--- Please Select Category ---"
            }
        });
    }
});

function GetAllActiveCategories() {
    let data = [];
    debugger;
    window.axios.get('/api/app/categories/catagories').then(function (response) {
        for (let i = 0; i < response.data.length; i++) {
            data.push({
                id: response.data[i].categoryId,
                label: response.data[i].categoryName
            });
        }
    });

    return data;
}  