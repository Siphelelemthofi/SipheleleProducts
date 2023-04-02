using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Suppliers;
using SipheleleProducts.Suppliers.Dto;
using SipheleleProducts.Suppliers.Entities;
using SipheleleProducts.ViewModels.Suppliers;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.ObjectMapping;

namespace SipheleleProducts.Web.Pages.Suppliers
{
    public class GetAllSuppliersModel : SipheleleProductsPageModel
    {
        [BindProperty]
        public List<GetAllSuppliersViewModel> getAllSuppliersViewModel { get; set; }
        private readonly ISuppliersAppService _suppliersAppService;
        public GetAllSuppliersModel(ISuppliersAppService suppliersAppService) { 
        _suppliersAppService = suppliersAppService; 
        }   
        public async Task<IActionResult> OnGet()
        {
            var GetAllSuppliers = await _suppliersAppService.GetAllSuppliers();
            getAllSuppliersViewModel =  ObjectMapper.Map<List<GetAllSuppliersDto>, List<GetAllSuppliersViewModel>>(GetAllSuppliers);
            return Page();
             
        }
    }
}
