using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Products.Dto;
using SipheleleProducts.Suppliers;
using SipheleleProducts.Suppliers.Dto;
using SipheleleProducts.ViewModels.Products;
using SipheleleProducts.ViewModels.Suppliers;
using System.Threading.Tasks;
using Volo.Abp.ObjectMapping;

namespace SipheleleProducts.Web.Pages.Suppliers
{
    public class UpdateSupplierModel : SipheleleProductsPageModel
    {
        [BindProperty]
        public UpdateSupplierViewModel UpdateSupplierViewModel { get; set; }  
        private readonly ISuppliersAppService _suppliersAppService;
        public UpdateSupplierModel(ISuppliersAppService suppliersAppService)
        {
            _suppliersAppService = suppliersAppService;

        }
        public void OnGet()
        {
        }
        public async Task<IActionResult> OnPostAsync()
        {
            if (ModelState.IsValid)
            {
                //check Duplicate Name 
                var AddNewProduct = await _suppliersAppService.UpdateSupplierById(ObjectMapper.Map<UpdateSupplierViewModel, UpdateSupplierByIdDto>(UpdateSupplierViewModel));
                //redirect To GetAllProduct
            }
            return Page();
        }
    }
}
