using dut.SipheleleProducts.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using SipheleleProducts.Categories.Entities;
using SipheleleProducts.EntityFrameworkCore;
using SipheleleProducts.Products.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Volo.Abp.Domain.Entities;
using Volo.Abp.Domain.Repositories.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore;

namespace SipheleleProducts.Products
{
    public class EfCoreProductsRepository : EfCoreRepository<SipheleleProductsDbContext, IEntity<Guid>>, IProductsRepository
    {
        public EfCoreProductsRepository(IDbContextProvider<SipheleleProductsDbContext> dbContextProvider) : base(dbContextProvider)
        {
        }
        public async Task<string> AddNewProduct(AddNewProduct addNewProduct, CancellationToken cancellationToken = default)
        {
            await RepositoryCommandAndConnection.EnsureConnectionOpenAsync(await GetDbContextAsync(),
            cancellationToken);
            SqlParameter[] sqlQueryParam =
            {
                new SqlParameter("@ProductName", addNewProduct.ProductName),
                new SqlParameter("@SupplierId", addNewProduct.SupplierId),
                new SqlParameter("@CategoryId", addNewProduct.CategoryId),
                new SqlParameter("@QuantityPerUnit", addNewProduct.QuantityPerUnit),
                new SqlParameter("@UnitPrice", addNewProduct.UnitPrice),
                new SqlParameter("@UnitInStock", addNewProduct.UnitInStock),
                new SqlParameter("@UnitOnOrder", addNewProduct.UnitOnOrder),
                new SqlParameter("@ReorderLevel", addNewProduct.ReorderLevel),
                new SqlParameter("@Discontinued", addNewProduct.Discontinued)

            };
            await using var command = RepositoryCommandAndConnection.CreateCommand(await GetDbContextAsync(), "AddNewProduct", CommandType.StoredProcedure, sqlQueryParam);
            return (string?)await command.ExecuteScalarAsync(cancellationToken) ?? string.Empty;
        }
        public async Task<List<GetAllProducts>> GetAllProducts(CancellationToken cancellationToken = default)
        {
            await RepositoryCommandAndConnection.EnsureConnectionOpenAsync(await GetDbContextAsync(), cancellationToken);

            await using var command = RepositoryCommandAndConnection.CreateCommand(await GetDbContextAsync(),
            "GetAllProducts", CommandType.StoredProcedure);
            await using var dataReader = await command.ExecuteReaderAsync(cancellationToken);
            return await dataReader.MapToList<GetAllProducts>(cancellationToken);
        }
        public async Task<string> UpdateProductById(UpdateProduct updateProduct,CancellationToken cancellationToken = default)
        {
            await RepositoryCommandAndConnection.EnsureConnectionOpenAsync(await GetDbContextAsync(),
             cancellationToken);
            SqlParameter[] sqlQueryParam =
            {
                new SqlParameter("@ProductId", updateProduct.ProductId),
                new SqlParameter("@ProductName", updateProduct.ProductName),
                new SqlParameter("@SupplierId", updateProduct.SupplierId),
                new SqlParameter("@CategoryId", updateProduct.CategoryId),
                new SqlParameter("@QuantityPerUnit", updateProduct.QuantityPerUnit),
                new SqlParameter("@UnitPrice", updateProduct.UnitPrice),
                new SqlParameter("@UnitInStock", updateProduct.UnitInStock),
                new SqlParameter("@UnitOnOrder", updateProduct.UnitOnOrder),
                new SqlParameter("@ReorderLevel", updateProduct.ReorderLevel),
                new SqlParameter("@Discontinued", updateProduct.Discontinued)
            };
            await using var command = RepositoryCommandAndConnection.CreateCommand(await GetDbContextAsync(), "UpdateProductById", CommandType.StoredProcedure, sqlQueryParam);
            return (string?)await command.ExecuteScalarAsync(cancellationToken) ?? string.Empty;
        }
        public async Task<string> RemoveProductById(int ProductId,CancellationToken cancellationToken = default)
        {
            await RepositoryCommandAndConnection.EnsureConnectionOpenAsync(await GetDbContextAsync(),cancellationToken);
            SqlParameter[] sqlQueryParam =
            {
                new SqlParameter("@ProductId", ProductId),

            };
            await using var command = RepositoryCommandAndConnection.CreateCommand(await GetDbContextAsync(), "RemoveProductById", CommandType.StoredProcedure, sqlQueryParam);
            return (string?)await command.ExecuteScalarAsync(cancellationToken) ?? string.Empty;
        }
    }
}
