using SipheleleProducts.Categories.Entities;
using SipheleleProducts.Categories;
using SipheleleProducts.Products.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Volo.Abp.Domain.Services;

namespace SipheleleProducts.Products.Manager
{
    public class ProductsManager : DomainService
    {
        private readonly IProductsRepository _productsRepository;
        private readonly StoringImageManager _storingImageManager;
        public ProductsManager(IProductsRepository productsRepository, StoringImageManager storingImageManager) { 
        
        _productsRepository = productsRepository;  
            _storingImageManager = storingImageManager; 
        } 
        public async Task<int> CountAllProducts()
        {
            var GetProducts = await _productsRepository.GetAllProducts();
            return GetProducts.Count();
        }
        public async Task  AddNewProduct(AddNewProduct addNewProduct)
        {
            addNewProduct.ImagePath = await _storingImageManager.SaveImages(addNewProduct.Picture);
            await _productsRepository.AddNewProduct(addNewProduct);
        }
        public async Task UpdateProductById(UpdateProduct updateProduct)
        {
            if (updateProduct.Picture is not null)
            {
                updateProduct.ImagePath = await _storingImageManager.SaveImages(updateProduct.Picture);
            }
            await _productsRepository.UpdateProductById(updateProduct);
        }
 
    }
}
