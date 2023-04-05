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
        public async void OnGet(int SupplierId)
        {
            var GetSupplierDetailsById = ObjectMapper.Map<GetSupplierDetailsByIdDto, GetSupplierDetailsByIdViewModel>(await _suppliersAppService.GetSuppliersDetailsById(SupplierId));
            UpdateSupplierViewModel = new UpdateSupplierViewModel()
            {
                SupplierId = SupplierId,
                CompanyName = GetSupplierDetailsById.CompanyName,
                ContactName = GetSupplierDetailsById.ContactName,
                ContactTitle = GetSupplierDetailsById.ContactTitle,
                Address = GetSupplierDetailsById.Address,
                City = GetSupplierDetailsById.City,
                Region = GetSupplierDetailsById.Region,
                Country = GetSupplierDetailsById.Country,
                PostalCode = GetSupplierDetailsById.PostalCode, 
                PhoneNumber = GetSupplierDetailsById.PhoneNumber,
                Fax = GetSupplierDetailsById.Fax,
                HomePage = GetSupplierDetailsById.HomePage,
            };
        }
        public async Task<IActionResult> OnPostAsync()
        {
            if (ModelState.IsValid)
            {
                //check Duplicate Name 
                 await _suppliersAppService.UpdateSupplierById(ObjectMapper.Map<UpdateSupplierViewModel, UpdateSupplierByIdDto>(UpdateSupplierViewModel));
                //redirect To GetAllProduct
                return RedirectToPage("/Suppliers/GetAllSuppliers");
            }
            return Page();
        }
    }
}
