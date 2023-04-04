using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Categories;
using SipheleleProducts.Categories.Dto;
using SipheleleProducts.Categories.Entities;
using SipheleleProducts.ViewModels.Catergories;
using System.Threading.Tasks;
using Volo.Abp.ObjectMapping;

namespace SipheleleProducts.Web.Pages.Categories
{
    public class GetCategorieDetailsByIdModel : SipheleleProductsPageModel
    {
        [BindProperty]
        public GetCategoryDetaislByCategoryByIdViewModel getCategoryDetaislByCategoryByIdViewModel { get; set; }
        private readonly ICategoriesAppService _categoriesAppService;

        public GetCategorieDetailsByIdModel(ICategoriesAppService categoriesAppService)
        {
            _categoriesAppService = categoriesAppService;
        }
        public async Task<IActionResult> OnGet(int CategoryId)
        {
           getCategoryDetaislByCategoryByIdViewModel= ObjectMapper.Map<GetCategoryDetaislByCategoryByIdDto, GetCategoryDetaislByCategoryByIdViewModel>(await _categoriesAppService.GetCategoryDetailsByCategoryById(CategoryId));
            return Page();
        }
    }
}
