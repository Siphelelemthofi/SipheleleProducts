using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Products;
using System.Threading.Tasks;

namespace SipheleleProducts.Web.Pages.Products
{
    public class ConfirmationDeleteOfProductsModel : SipheleleProductsPageModel
    {
        private readonly IProductsAppService _productsAppService;
        public ConfirmationDeleteOfProductsModel(IProductsAppService productsAppService)
        {
            _productsAppService = productsAppService;

        }
        public void OnGet()
        {
        }
        public async Task<IActionResult> OnPost(int ProductId) { 
        
            await _productsAppService.DeleteByProductById(ProductId);   
            return Page();
        }
    }
}
