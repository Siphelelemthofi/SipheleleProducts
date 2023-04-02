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
        private readonly ICategoriesAppService _categoriesAppService;
        public UpdateCategoryModel(ICategoriesAppService categoriesAppService)
        {
            _categoriesAppService = categoriesAppService;
        }
        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync() {
            if (ModelState.IsValid)
            {
                var UpdateCategory = ObjectMapper.Map<UpdateCategoryViewModel, UpdateCategoryDto>(updateCategoryViewModel);
                var ReturnResult = await _categoriesAppService.UpdateCategoryById(UpdateCategory);
                if (ReturnResult.Equals("Success"))
                {
                    //return page
                }
            }

            return Page();  
        }    

    }
}
