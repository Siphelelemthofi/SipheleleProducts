using SipheleleProducts.Categories.Dto;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace SipheleleProducts.Categories
{
    public interface ICategoriesAppService
    {
        Task<Guid> AddNewCatagory(AddNewCategoryDto addNewCategoryDto);
        Task<List<GetListOfAllCatagoriesDto>> GetAllCatagories();
        Task<string> UpdateCategoryById(UpdateCategoryDto updateCategoryDto);
        Task<string> DeleteCategoryById(int CategoryId);    
    }
}
