using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Products;
using SipheleleProducts.Products.Dto;
using SipheleleProducts.ViewModels.Products;
using System.Threading.Tasks;

namespace SipheleleProducts.Web.Pages.Products
{
    public class UpdateProductModel : SipheleleProductsPageModel
    {
        [BindProperty]
        public UpdateProductViewModel updateProductViewModel { get; set; }  
        private readonly IProductsAppService _productsAppService;
        public UpdateProductModel(IProductsAppService productsAppService)
        {
            _productsAppService = productsAppService;
        }
        public void OnGet()
        {
            //add get details for product
        }
        public async Task<IActionResult> OnPostAsync()
        {
            if (ModelState.IsValid)
            {
                var AddNewProduct = await _productsAppService.AddNewProduct(ObjectMapper.Map<UpdateProductViewModel, UpdateProductByIdDto>(updateProductViewModel));
                //redirect To GetAllProduct
            }
            return Page();
        }
    }
}
