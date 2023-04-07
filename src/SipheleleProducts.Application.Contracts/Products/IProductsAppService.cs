using SipheleleProducts.Products.Dto;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace SipheleleProducts.Products
{
    public interface IProductsAppService
    {
        Task AddNewProduct(AddNewProductDto addNewProductDto);
        Task<List<GetAllProductDto>> GetAllProducts();
        Task UpdateByProductById(UpdateProductByIdDto updateProductByIdDto);
        Task<string> DeleteByProductById(int ProductId);
        Task<int> CountTotalNumberOfProducts();
        Task<GetProductDetailsByIdDto> GetProductDetailsById(int ProductId);


    }
}
