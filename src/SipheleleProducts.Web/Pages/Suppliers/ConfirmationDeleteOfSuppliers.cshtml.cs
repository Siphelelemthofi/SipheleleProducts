using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Suppliers;
using SipheleleProducts.Suppliers.Dto;
using SipheleleProducts.ViewModels;
using SipheleleProducts.ViewModels.Suppliers;
using System.Threading.Tasks;
using Volo.Abp.ObjectMapping;

namespace SipheleleProducts.Web.Pages.Suppliers
{
    public class ConfirmationDeleteOfSuppliersModel : SipheleleProductsPageModel
    {
        [BindProperty]
        public RemoveSupplierViewModel RemoveSupplierViewModel { get; set; }
        private readonly ISuppliersAppService _suppliersAppService;
        public ConfirmationDeleteOfSuppliersModel(ISuppliersAppService suppliersAppService)
        {
            _suppliersAppService = suppliersAppService;
        }
        public async void OnGet(int SupplierId)
        {
            var GetSupplierDetailsById = ObjectMapper.Map<GetSupplierDetailsByIdDto, GetSupplierDetailsByIdViewModel>(await _suppliersAppService.GetSuppliersDetailsById(SupplierId));
            RemoveSupplierViewModel = new RemoveSupplierViewModel()
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
        public async Task<IActionResult> OnPost(int SupplierId)
        {
            await _suppliersAppService.RemoveSupplierById(SupplierId);
            return RedirectToPage("/Suppliers/GetAllSuppliers");
        }
    }
}
