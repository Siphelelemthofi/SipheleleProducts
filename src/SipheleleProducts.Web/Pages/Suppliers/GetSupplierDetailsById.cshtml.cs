using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Suppliers;
using SipheleleProducts.Suppliers.Dto;
using SipheleleProducts.Suppliers.Entities;
using SipheleleProducts.ViewModels.Suppliers;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SipheleleProducts.Web.Pages.Suppliers
{
    public class GetSupplierDetailsByIdModel : SipheleleProductsPageModel
    {
        [BindProperty]
        public GetSupplierDetailsByIdViewModel getSupplierDetailsByIdViewModel { get; set; }
        private readonly ISuppliersAppService _suppliersAppService;
        public GetSupplierDetailsByIdModel(ISuppliersAppService suppliersAppService)
        {
            _suppliersAppService = suppliersAppService;
        }
        public async Task<IActionResult>  OnGet(int SupplierId)
        {
            getSupplierDetailsByIdViewModel = ObjectMapper.Map<GetSupplierDetailsByIdDto, GetSupplierDetailsByIdViewModel>(await _suppliersAppService.GetSuppliersDetailsById(SupplierId));
            return Page();
        }
    }
}
