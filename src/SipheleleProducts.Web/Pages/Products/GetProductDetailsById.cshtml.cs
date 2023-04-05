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

namespace SipheleleProducts.Web.Pages.Products
{
    public class GetProductDetailsByIdModel : SipheleleProductsPageModel
    {
        [BindProperty]
        public GetProductDetailsByIdViewModel getProductDetailsByIdModel { get; set; }
        private readonly IProductsAppService _productsAppService;
        public GetProductDetailsByIdModel(IProductsAppService productsAppService)
        {
            _productsAppService = productsAppService;
        }
        public async void OnGet(int ProductId)
        {
            getProductDetailsByIdModel = ObjectMapper.Map<GetProductDetailsByIdDto, GetProductDetailsByIdViewModel>(await _productsAppService.GetProductDetailsById(ProductId));
        }
    }
}
