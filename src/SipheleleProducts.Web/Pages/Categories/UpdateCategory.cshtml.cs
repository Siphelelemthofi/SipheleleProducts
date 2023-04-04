using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Categories;
using SipheleleProducts.Categories.Dto;
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
        public UpdateCategoryModel(ICategoriesAppService categoriesAppService)
        {
            _categoriesAppService = categoriesAppService;
        }
        public async Task<IActionResult> OnGet(int CategoryId)
        {
            var getCateroryDetails = ObjectMapper.Map<GetCategoryDetaislByCategoryByIdDto, GetCategoryDetaislByCategoryByIdViewModel>(await _categoriesAppService.GetCategoryDetailsByCategoryById(CategoryId));
            updateCategoryViewModel = new UpdateCategoryViewModel()
            {
                CategoryId = getCateroryDetails.CategoryId,
                CategoryName = getCateroryDetails.CategoryName,
                Picture = getCateroryDetails.Picture,
            };
            return Page();
        }

        public async Task<IActionResult> OnPostAsync() {
            if (ModelState.IsValid)
            {
                var UpdateCategory = ObjectMapper.Map<UpdateCategoryViewModel, UpdateCategoryDto>(updateCategoryViewModel);
                var ReturnResult = await _categoriesAppService.UpdateCategoryById(UpdateCategory);
                if (ReturnResult.Equals("Success"))
                {
                    return RedirectToPage("/Categories/GetAllCategories");
                }
            }

            return Page();  
        }    

    }
}
