using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Products;
using SipheleleProducts.Products.Dto;
using SipheleleProducts.ViewModels.Products;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.ObjectMapping;

namespace SipheleleProducts.Web.Pages.Products
{
    public class GetAllProductsModel : SipheleleProductsPageModel
    {
        [BindProperty]
        public List<GetAllProductViewModel> getAllProductViewModel { get; set; }
        private readonly IProductsAppService _productsAppService;
        public GetAllProductsModel(IProductsAppService productsAppService)
        {
            _productsAppService = productsAppService;
        }
        public async Task<IActionResult> OnGet()
        {
            var GetAllProducts = await _productsAppService.GetAllProducts();
            getAllProductViewModel = ObjectMapper.Map<List<GetAllProductDto>,List<GetAllProductViewModel>>(GetAllProducts);
            return Page();
        }
    }
}
