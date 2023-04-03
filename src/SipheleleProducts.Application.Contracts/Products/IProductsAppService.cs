using SipheleleProducts.Products.Dto;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace SipheleleProducts.Products
{
    public interface IProductsAppService
    {
        Task<string> AddNewProduct(AddNewProductDto addNewProductDto);
        Task<List<GetAllProductDto>> GetAllProducts();
        Task<string> UpdateByProductById(UpdateProductByIdDto updateProductByIdDto);
        Task<string> DeleteByProductById(int ProductId);
        Task<int> CountTotalNumberOfProducts();


    }
}
