using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Categories;
using System.Threading.Tasks;

namespace SipheleleProducts.Web.Pages.Categories
{
    public class ConfirmationDeleteOfCategoriesModel : SipheleleProductsPageModel
    {
        private readonly ICategoriesAppService _categoriesAppService;
        public ConfirmationDeleteOfCategoriesModel(ICategoriesAppService categoriesAppService)
        {
            _categoriesAppService = categoriesAppService;   

        }
        public void OnGet()
        {

        }
        public async Task<IActionResult> OnPost(int CategoryId)
        {
            await _categoriesAppService.DeleteCategoryById(CategoryId);
            return Page();
        }    
    }
}
