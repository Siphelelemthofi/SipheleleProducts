using SipheleleProducts.Products.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace SipheleleProducts.Products
{
    public interface IProductsRepository
    {
        Task AddNewProduct(AddNewProduct addNewProduct, CancellationToken cancellationToken = default);
        Task<List<GetAllProducts>> GetAllProducts(CancellationToken cancellationToken = default);
        Task UpdateProductById(UpdateProduct updateProduct, CancellationToken cancellationToken = default);
         Task<string> RemoveProductById(int ProductId, CancellationToken cancellationToken = default);
        Task<GetProductDetailsById> GetProductDetailsById(int ProductId, CancellationToken cancellationToken = default);
    }
}
