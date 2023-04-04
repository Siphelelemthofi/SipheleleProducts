using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Categories;
using SipheleleProducts.Categories.Dto;
using SipheleleProducts.ViewModels.Catergories;
using System.Threading.Tasks;

namespace SipheleleProducts.Web.Pages.Categories
{
    public class AddCategoryModel : SipheleleProductsPageModel
    {
        [BindProperty]
        public AddNewCategoryViewModel addNewCategoryViewModel { get; set; }
        private readonly ICategoriesAppService _categoriesAppService;

        public AddCategoryModel(ICategoriesAppService categoriesAppService)
        {
            _categoriesAppService = categoriesAppService;
        }
        public void OnGet()
        {
        }
        public async Task<IActionResult> OnPostAsync()
        {
            if(ModelState.IsValid)
            {
                //Add to check the duplicate 
                var AddNewCategory = ObjectMapper.Map<AddNewCategoryViewModel, AddNewCategoryDto>(addNewCategoryViewModel);
                var AddNewCategoryReturnResult = await _categoriesAppService.AddNewCatagory(AddNewCategory);
                //redirect to get all category
                return RedirectToPage("/Categories/GetAllCategories");
            }
            return Page();
        }
    }
}
