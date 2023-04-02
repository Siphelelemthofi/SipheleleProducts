using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Products;
using SipheleleProducts.Products.Dto;
using SipheleleProducts.ViewModels.Products;
using System.Threading.Tasks;

namespace SipheleleProducts.Web.Pages.Products
{
    public class AddProductModel : SipheleleProductsPageModel
    {
        [BindProperty]
        public AddNewProductViewModel addNewProductViewModel { get; set; }  
        private readonly IProductsAppService _productsAppService;
        public AddProductModel(IProductsAppService productsAppService)
        {
            _productsAppService = productsAppService;
        }

        public void OnGet()
        {
        }
        public async Task<IActionResult> OnPostAsync() 
        {
            if(ModelState.IsValid)
            {
                var AddNewProduct = await _productsAppService.AddNewProduct(ObjectMapper.Map<AddNewProductViewModel, AddNewProductDto>(addNewProductViewModel));
                //redirect To GetAllProduct
            } 
            return Page();
        }
    }
}
