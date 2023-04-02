using SipheleleProducts.Categories.Dto;
using SipheleleProducts.Categories.Entities;
using SipheleleProducts.Categories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SipheleleProducts.Products.Dto;
using Volo.Abp.ObjectMapping;
using SipheleleProducts.Products.Entities;

namespace SipheleleProducts.Products
{
    public class ProductsAppService: SipheleleProductsAppService, IProductsAppService
    {
        private readonly IProductsRepository _productsRepository;   
        public ProductsAppService(IProductsRepository productsRepository) {
            _productsRepository = productsRepository;
        }
        public async Task<string> AddNewProduct(AddNewProductDto addNewProductDto)
        {
            return await _productsRepository.AddNewProduct(ObjectMapper.Map<AddNewProductDto, AddNewProduct>(addNewProductDto));
        }
        public async Task<List<GetAllProductDto>> GetAllProducts()
        {
            var GetProducts = await _productsRepository.GetAllProducts();
            return ObjectMapper.Map<List<GetAllProducts>, List<GetAllProductDto>>(GetProducts);
        }
        public async Task<string> UpdateCategoryById(UpdateProductByIdDto updateProductByIdDto)
        {
            var UpdateCategory = ObjectMapper.Map<UpdateProductByIdDto, UpdateProduct>(updateProductByIdDto);
            return await _productsRepository.UpdateProductById(UpdateCategory); 
        }
        public async Task<string> DeleteCategoryById(int ProductId)
        {
            return await _productsRepository.RemoveProductById(ProductId);
        }
    }
}
