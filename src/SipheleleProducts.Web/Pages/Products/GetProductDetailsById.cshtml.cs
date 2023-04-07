using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Products;
using SipheleleProducts.Suppliers.Dto;
using SipheleleProducts.Suppliers.Entities;
using SipheleleProducts.Suppliers;
using SipheleleProducts.ViewModels.Products;
using System.Collections.Generic;
using Volo.Abp.ObjectMapping;
using SipheleleProducts.Products.Dto;
using System.Threading.Tasks;

namespace SipheleleProducts.Web.Pages.Products
{
    public class GetProductDetailsByIdModel : SipheleleProductsPageModel
    {
        [BindProperty]
        public GetProductDetailsByIdViewModel getProductDetailsByIdViewModel { get; set; }
        private readonly IProductsAppService _productsAppService;
        public GetProductDetailsByIdModel(IProductsAppService productsAppService)
        {
            _productsAppService = productsAppService;
        }
        public async Task<IActionResult> OnGet(int ProductId)
        {
            getProductDetailsByIdViewModel = ObjectMapper.Map<GetProductDetailsByIdDto, GetProductDetailsByIdViewModel>(await _productsAppService.GetProductDetailsById(ProductId));
            return Page();
        }
    }
}
