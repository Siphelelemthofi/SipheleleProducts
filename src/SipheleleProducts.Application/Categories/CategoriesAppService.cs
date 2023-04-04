using SipheleleProducts.Categories.Dto;
using SipheleleProducts.Categories.Entities;
using SipheleleProducts.Categories.Manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Volo.Abp.ObjectMapping;

namespace SipheleleProducts.Categories
{
    public class CategoriesAppService: SipheleleProductsAppService, ICategoriesAppService
    {
        private readonly ICategoriesRepository _categoriesRepository;
        
        public CategoriesAppService(ICategoriesRepository categoriesRepository ) { 
        
        _categoriesRepository = categoriesRepository;
    
        }
        public async Task<Guid> AddNewCatagory(AddNewCategoryDto addNewCategoryDto)
        {
            return await _categoriesRepository.AddNewCatagory(ObjectMapper.Map<AddNewCategoryDto, AddNewCategory>(addNewCategoryDto));
        }
        public async Task<List<GetListOfAllCatagoriesDto>> GetAllCatagories()
        {
            var getCatagories = await _categoriesRepository.GetAllCategories();
            return ObjectMapper.Map<List<GetListOfAllCatagories>, List<GetListOfAllCatagoriesDto>>(getCatagories);
        }
        public async Task<string> UpdateCategoryById(UpdateCategoryDto updateCategoryDto)
        {
            var UpdateCategory = ObjectMapper.Map<UpdateCategoryDto, UpdateCategory>(updateCategoryDto);
            return await _categoriesRepository.UpdateCategoryById(UpdateCategory);
        }
        public async Task<string> DeleteCategoryById(int CategoryId)
        {
            return await _categoriesRepository.DeleteCategoryById(CategoryId); 
        }
        public async Task<GetCategoryDetaislByCategoryByIdDto> GetCategoryDetailsByCategoryById(int CategoryId)
        {
            var getCatagoryByCategoryId = await _categoriesRepository.GetCategoryDetaislByCategoryById(CategoryId);
            return ObjectMapper.Map<GetCategoryDetaislByCategoryById, GetCategoryDetaislByCategoryByIdDto>(getCatagoryByCategoryId);
        }
        public async Task<int> CountAvailbleCategories()
        {
            var getTotalCategories =  await GetAllCatagories(); 
            return getTotalCategories.Count();
        }
    }
}
