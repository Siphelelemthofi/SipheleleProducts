using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Categories;
using SipheleleProducts.Categories.Dto;
using SipheleleProducts.ViewModels.Catergories;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SipheleleProducts.Web.Pages.Categories
{
    public class GetAllCategoriesModel : SipheleleProductsPageModel
    {
        [BindProperty]
        public List<GetListOfAllCatagoriesViewModel> getListOfAllCatagoriesViewModel { get; set; }    
        private readonly ICategoriesAppService _categoriesAppService;
        public GetAllCategoriesModel(ICategoriesAppService categoriesAppService)
        {
            _categoriesAppService = categoriesAppService;   
        }
        public async Task<IActionResult> OnGet()
        {
            var GetCategories = await _categoriesAppService.GetAllCatagories();
            getListOfAllCatagoriesViewModel = ObjectMapper.Map<List<GetListOfAllCatagoriesDto>,List<GetListOfAllCatagoriesViewModel>>(GetCategories);
            return Page();  
        }
    }
}
