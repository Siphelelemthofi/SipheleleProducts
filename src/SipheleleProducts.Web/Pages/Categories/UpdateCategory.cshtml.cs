using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Categories;
using SipheleleProducts.Categories.Dto;
using SipheleleProducts.Categories.Manager;
using SipheleleProducts.ViewModels.Catergories;
using System.Threading.Tasks;
using Volo.Abp.ObjectMapping;

namespace SipheleleProducts.Web.Pages.Categories
{
    public class UpdateCategoryModel : SipheleleProductsPageModel
    {
  
        [BindProperty]
        public UpdateCategoryViewModel updateCategoryViewModel { get; set; }
        [BindProperty]
        public GetCategoryDetaislByCategoryByIdViewModel getCategoryDetaislByCategoryByIdViewModel { get; set; }
        private readonly ICategoriesAppService _categoriesAppService;
        private readonly CategoriesManager _categoriesManager;
        public UpdateCategoryModel(ICategoriesAppService categoriesAppService, CategoriesManager categoriesManager)
        {
            _categoriesAppService = categoriesAppService;
            _categoriesManager = categoriesManager;
        }
        public async Task<IActionResult> OnGet(int CategoryId)
        {

            var getCateroryDetails = ObjectMapper.Map<GetCategoryDetaislByCategoryByIdDto, GetCategoryDetaislByCategoryByIdViewModel>(await _categoriesAppService.GetCategoryDetailsByCategoryById(CategoryId));
            updateCategoryViewModel = new UpdateCategoryViewModel()
            {
                CategoryId = getCateroryDetails.CategoryId,
                CategoryName = getCateroryDetails.CategoryName,
                Description = getCateroryDetails.Description,
                ImagePath = getCateroryDetails.ImagePath

        };
            return Page();
        }
        public async Task<IActionResult> OnPostAsync() 
        {

            if (string.IsNullOrEmpty(updateCategoryViewModel.CategoryName) || string.IsNullOrEmpty(updateCategoryViewModel.ImagePath) || updateCategoryViewModel.CategoryId == 0 || string.IsNullOrEmpty(updateCategoryViewModel.Description))
            {
                return Page();
            }
            var UpdateCategory = ObjectMapper.Map<UpdateCategoryViewModel, UpdateCategoryDto>(updateCategoryViewModel);
            await _categoriesAppService.UpdateCategoryById(UpdateCategory);
            return RedirectToPage("/Categories/GetAllCategories");
        
        }    

    }
}
