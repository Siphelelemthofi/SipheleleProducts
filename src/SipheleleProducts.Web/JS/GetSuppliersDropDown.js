Vue.component('v-select', VueSelect.VueSelect);
var appFilterEmails = new Vue({
    el: '#appFilterSuppliers',
    data: {

        options: GetEmails()
    },
    methods: {
        changeHandler(Suppliers) {

            if (Suppliers) {
                $('#supplierId').val(Suppliers.id);
                $('#companyName').val(Suppliers.label);
            } else {
                $('#supplierId').val(null);
            }
        }
    },

    render(h) {
        return (
            <v-select value={this.selected} on-input={this.changeHandler} options={this.options} item-value={this.options} item-text={this.options} placeholder="--Select Supplier--">
            </v-select>
        )
    }
})
function GetEmails() {
    let data = [];

    window.axios.get('/api/app/application/emailsToSendSmsTo/')
        .then(function (response) {
            for (let i = 0; i < response.data.length; i++) {
                data.push({
                    id: response.data[i].supplierId,
                    label: response.data[i].companyName
                });
            }
        });
    return (data);
}