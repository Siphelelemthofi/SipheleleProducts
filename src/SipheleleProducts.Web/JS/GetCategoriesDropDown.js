Vue.component('v-select', VueSelect.VueSelect);
var appFilterEmails = new Vue({
    el: '#appFilterCategories',
    data: {

        options: GetEmails()
    },
    methods: {
        changeHandler(categoryName) {

            if (EmailAdress) {
                $('#categoryId').val(categoryName.id);
                $('#categoryName').val(categoryName.label);
            } else {
                $('#categoryId').val(null);
            }
        }
    },

    render(h) {
        return (
            <v-select value={this.selected} on-input={this.changeHandler} options={this.options} item-value={this.options} item-text={this.options} placeholder="--Select Category--">
            </v-select>
        )
    }
})
function GetEmails() {
    let data = [];
    debugger;
    window.axios.get('/api/app/application/emailsToSendSmsTo/')
        .then(function (response) {
            for (let i = 0; i < response.data.length; i++) {
                data.push({
                    id: response.data[i].categoryId,
                    label: response.data[i].categoryName
                });
            }
        });
    return (data);
}