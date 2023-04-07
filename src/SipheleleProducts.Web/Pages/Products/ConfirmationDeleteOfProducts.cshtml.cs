using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Products;
using SipheleleProducts.ViewModels.Products;
using System.Threading.Tasks;

namespace SipheleleProducts.Web.Pages.Products
{
    public class ConfirmationDeleteOfProductsModel : SipheleleProductsPageModel
    {
        [BindProperty]
        public RemoveProductViewModel removeProductViewModel { get; set; }
        private readonly IProductsAppService _productsAppService;
        public ConfirmationDeleteOfProductsModel(IProductsAppService productsAppService)
        {
            _productsAppService = productsAppService;

        }
        public async void OnGet(int ProductId)
        {
            var getProductDetails = await _productsAppService.GetProductDetailsById(ProductId);
            removeProductViewModel = new RemoveProductViewModel()
            {
                ProductId = getProductDetails.ProductId,
                CompanyName = getProductDetails.CompanyName,
                CategoryName = getProductDetails.CategoryName,
                UnitInStock = getProductDetails.UnitInStock,
                UnitPrice = getProductDetails.UnitPrice,
                ProductName = getProductDetails.ProductName,
                SupplierId = getProductDetails.SupplierId,
                CategoryId = getProductDetails.CategoryId,
                ImagePath = getProductDetails.ImagePath,

            };
        }
        public async Task<IActionResult> OnPost(int ProductId) { 
        
            await _productsAppService.DeleteByProductById(ProductId);
            return RedirectToPage("/Products/GetAllProducts");
        }
    }
}
