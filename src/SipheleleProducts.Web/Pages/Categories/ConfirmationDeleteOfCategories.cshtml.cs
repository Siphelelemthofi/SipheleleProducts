using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Categories;
using SipheleleProducts.Categories.Dto;
using SipheleleProducts.ViewModels.Catergories;
using System.Threading.Tasks;
using Volo.Abp.ObjectMapping;

namespace SipheleleProducts.Web.Pages.Categories
{
    public class ConfirmationDeleteOfCategoriesModel : SipheleleProductsPageModel
    {
        [BindProperty]
        public RemoveCategoryViewModel removeCategoryViewModel { get; set; }
        private readonly ICategoriesAppService _categoriesAppService;
        public ConfirmationDeleteOfCategoriesModel(ICategoriesAppService categoriesAppService)
        {
            _categoriesAppService = categoriesAppService;   

        }
        public async Task<IActionResult> OnGet(int CategoryId)
        {
            var getCateroryDetails = ObjectMapper.Map<GetCategoryDetaislByCategoryByIdDto, GetCategoryDetaislByCategoryByIdViewModel>(await _categoriesAppService.GetCategoryDetailsByCategoryById(CategoryId));
            removeCategoryViewModel = new RemoveCategoryViewModel()
            {
                CategoryId = getCateroryDetails.CategoryId,
                CategoryName = getCateroryDetails.CategoryName,
                ImagePath = getCateroryDetails.ImagePath,
                Description = getCateroryDetails.Description
            };
            return Page();
        }

        public async Task<IActionResult> OnPost(int CategoryId)
        {
            await _categoriesAppService.DeleteCategoryById(CategoryId);
            return RedirectToPage("/Categories/GetAllCategories");
        }    
    }
}
