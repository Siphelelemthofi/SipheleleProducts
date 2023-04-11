using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Internal;
using SipheleleProducts.Categories.Entities;
using SipheleleProducts.ViewModels.Catergories;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Volo.Abp.Domain.Services;

namespace SipheleleProducts.Categories.Manager
{
    public class CategoriesManager:DomainService
    {
        private readonly ICategoriesRepository _categoriesRepository;
        private readonly StoringImageManager _storingImageManager;
        public CategoriesManager(ICategoriesRepository categoriesRepository, StoringImageManager storingImageManager) {
            _categoriesRepository = categoriesRepository;
            _storingImageManager = storingImageManager;
        }

        public async Task<bool> CheckIfCategoryExists(string CategoryName)
        {
            var GetAllExistingCategories = await _categoriesRepository.GetAllCategories();
            var GetMatchingCategoryName = from Categories in GetAllExistingCategories where Categories.CategoryName.Equals(CategoryName) select Categories;
            if (GetMatchingCategoryName is null)
                return false;
            return true;

        }
        public async Task<int> CountAvailableCategories()
        {
            var GetAllExistingCategories = await _categoriesRepository.GetAllCategories();
            return GetAllExistingCategories.Count();
        }
        public async Task AddNewCatagory(AddNewCategory addNewCategorys)
        {
            addNewCategorys.ImagePath = await _storingImageManager.SaveImages(addNewCategorys.Picture);
            await _categoriesRepository.AddNewCatagory(addNewCategorys);
        }

        public async Task UpdateCategoryById(UpdateCategory updateCategory)
        {
            if (updateCategory.Picture is not null)
            {
                updateCategory.ImagePath = await _storingImageManager.SaveImages(updateCategory.Picture);
            }
            await _categoriesRepository.UpdateCategoryById(updateCategory);
        }


    }

}
