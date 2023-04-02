using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Products.Dto;
using SipheleleProducts.Suppliers;
using SipheleleProducts.Suppliers.Dto;
using SipheleleProducts.Suppliers.Entities;
using SipheleleProducts.ViewModels.Products;
using SipheleleProducts.ViewModels.Suppliers;
using System.Threading.Tasks;
using Volo.Abp.ObjectMapping;

namespace SipheleleProducts.Web.Pages.Suppliers
{
    public class AddSupplierModel : SipheleleProductsPageModel
    {
        [BindProperty]
        public AddNewSupplierViewModel addNewSupplierViewModel { get; set; }    
        private readonly ISuppliersAppService _suppliersAppService;
        public AddSupplierModel(ISuppliersAppService suppliersAppService)
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
                //add the check for duplicates
                var AddSupplier = await _suppliersAppService.AddNewSupplier(ObjectMapper.Map<AddNewSupplierViewModel, AddNewSupplierDto>(addNewSupplierViewModel));
                if(AddSupplier.Equals("Success"))
                {
                    //return GetAll for suppliers
                }

            }
            return Page();
        }
    }
}
