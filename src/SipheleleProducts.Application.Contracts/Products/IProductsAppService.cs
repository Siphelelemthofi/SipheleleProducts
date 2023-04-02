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
        Task<string> UpdateCategoryById(UpdateProductByIdDto updateProductByIdDto);
        Task<string> DeleteCategoryById(int ProductId);
    }
}
