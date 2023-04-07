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
using SipheleleProducts.Suppliers.Entities;
using System.Threading;
using SipheleleProducts.Suppliers.Dto;
using SipheleleProducts.Products.Manager;

namespace SipheleleProducts.Products
{
    public class ProductsAppService: SipheleleProductsAppService, IProductsAppService
    {
        private readonly IProductsRepository _productsRepository;
        private readonly ProductsManager _productsManager;
        public ProductsAppService(IProductsRepository productsRepository,ProductsManager productsManager) {
            _productsRepository = productsRepository;
            _productsManager = productsManager;
        }
        public async Task AddNewProduct(AddNewProductDto addNewProductDto)
        {
             await _productsManager.AddNewProduct(ObjectMapper.Map<AddNewProductDto, AddNewProduct>(addNewProductDto));
        }
        public async Task<List<GetAllProductDto>> GetAllProducts()
        {
            var GetProducts = await _productsRepository.GetAllProducts();
            return ObjectMapper.Map<List<GetAllProducts>, List<GetAllProductDto>>(GetProducts);
        }
        public async Task UpdateByProductById(UpdateProductByIdDto updateProductByIdDto)
        {
            var UpdateCategory = ObjectMapper.Map<UpdateProductByIdDto, UpdateProduct>(updateProductByIdDto);
             await _productsManager.UpdateProductById(UpdateCategory); 
        }
        public async Task<string> DeleteByProductById(int ProductId)
        {
            return await _productsRepository.RemoveProductById(ProductId);
        }
        public async Task<int> CountTotalNumberOfProducts()
        {
            var CountAllProduct = await GetAllProducts();
            return CountAllProduct.Count;
        }
        public  async Task<GetProductDetailsByIdDto> GetProductDetailsById(int ProductId)
        {
            var getCatagoryByCategoryId = await _productsRepository.GetProductDetailsById(ProductId);
            return ObjectMapper.Map<GetProductDetailsById, GetProductDetailsByIdDto>(getCatagoryByCategoryId);
        }


    }
}
