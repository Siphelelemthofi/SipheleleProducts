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
        public async void OnGet(int ProductId)
        {
            var getProductDetails = await _productsAppService.GetProductDetailsById(ProductId);
            updateProductViewModel = new UpdateProductViewModel()
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
        public async Task<IActionResult> OnPostAsync()
        {
               if(updateProductViewModel.UnitInStock < 0 
                || updateProductViewModel.UnitPrice < 0 || updateProductViewModel.SupplierId ==0 ||updateProductViewModel.CategoryId ==0 || string.IsNullOrEmpty(updateProductViewModel.ProductName))
               {
                return Page();
               }
                var UpdateProduct = ObjectMapper.Map<UpdateProductViewModel, UpdateProductByIdDto>(updateProductViewModel);
                await _productsAppService.UpdateByProductById(UpdateProduct);
                return RedirectToPage("/Products/GetAllProducts");
            
          
        }
    }
}
