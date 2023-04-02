using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SipheleleProducts.Categories.Manager
{
    public class CategoriesManager
    {
        private readonly ICategoriesRepository _categoriesRepository;   
        public CategoriesManager(ICategoriesRepository categoriesRepository) { 
        _categoriesRepository = categoriesRepository;
        }
        
        public async Task<bool> CheckIfCategoryExists(string CategoryName) 
        {
            var GetAllExistingCategories = await _categoriesRepository.GetAllCategories();
            var GetMatchingCategoryName = from Categories in GetAllExistingCategories where Categories.CategoryName.Equals(CategoryName) select Categories;
            if(GetMatchingCategoryName is null)
                 return false;
            return true;    

        }

    }

}
