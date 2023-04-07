using dut.SipheleleProducts.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using SipheleleProducts.Categories.Entities;
using SipheleleProducts.EntityFrameworkCore;
using SipheleleProducts.Products.Entities;
using SipheleleProducts.Suppliers.Entities;
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
        public async Task  AddNewProduct(AddNewProduct addNewProduct, CancellationToken cancellationToken = default)
        {
            await RepositoryCommandAndConnection.EnsureConnectionOpenAsync(await GetDbContextAsync(),
            cancellationToken);
            SqlParameter[] sqlQueryParam =
            {
                new SqlParameter("@ProductName", addNewProduct.ProductName),
                new SqlParameter("@SupplierId", addNewProduct.SupplierId),
                new SqlParameter("@CategoryId", addNewProduct.CategoryId),
                new SqlParameter("@UnitPrice", addNewProduct.UnitPrice),
                new SqlParameter("@UnitInStock", addNewProduct.UnitInStock),
                new SqlParameter("@ImagePath", addNewProduct.ImagePath),
            };
            await using var command = RepositoryCommandAndConnection.CreateCommand(await GetDbContextAsync(), "AddNewProduct", CommandType.StoredProcedure, sqlQueryParam);
            await using var dataReader = await command.ExecuteReaderAsync(cancellationToken);
            await dataReader.MapToObject<AddNewProduct>(cancellationToken);
        }
        public async Task<List<GetAllProducts>> GetAllProducts(CancellationToken cancellationToken = default)
        {
            await RepositoryCommandAndConnection.EnsureConnectionOpenAsync(await GetDbContextAsync(), cancellationToken);

            await using var command = RepositoryCommandAndConnection.CreateCommand(await GetDbContextAsync(),
            "GetAllProducts", CommandType.StoredProcedure);
            await using var dataReader = await command.ExecuteReaderAsync(cancellationToken);
            return await dataReader.MapToList<GetAllProducts>(cancellationToken);
        }
        public async Task  UpdateProductById(UpdateProduct updateProduct,CancellationToken cancellationToken = default)
        {
            await RepositoryCommandAndConnection.EnsureConnectionOpenAsync(await GetDbContextAsync(),
             cancellationToken);
            SqlParameter[] sqlQueryParam =
            {
                new SqlParameter("@ProductId", updateProduct.ProductId),
                new SqlParameter("@ProductName", updateProduct.ProductName),
                new SqlParameter("@SupplierId", updateProduct.SupplierId),
                new SqlParameter("@CategoryId", updateProduct.CategoryId),
                new SqlParameter("@UnitPrice", updateProduct.UnitPrice),
                new SqlParameter("@UnitInStock", updateProduct.UnitInStock),
                new SqlParameter("@ImagePath", updateProduct.ImagePath),
            };
            await using var command = RepositoryCommandAndConnection.CreateCommand(await GetDbContextAsync(), "UpdateProductById", CommandType.StoredProcedure, sqlQueryParam);
            await using var dataReader = await command.ExecuteReaderAsync(cancellationToken);
            await dataReader.MapToObject<UpdateProduct>(cancellationToken);
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
        public async Task<GetProductDetailsById> GetProductDetailsById(int ProductId, CancellationToken cancellationToken = default)
        {
            await RepositoryCommandAndConnection.EnsureConnectionOpenAsync(await GetDbContextAsync(), cancellationToken);
            SqlParameter[] sqlQueryParam =
            {
                new SqlParameter("@ProductId", ProductId),

            };
            await using var command = RepositoryCommandAndConnection.CreateCommand(await GetDbContextAsync(), "GetProductDetailsById", CommandType.StoredProcedure, sqlQueryParam);
            await using var dataReader = await command.ExecuteReaderAsync(cancellationToken);
            return await dataReader.MapToObject<GetProductDetailsById>(cancellationToken);
        }
    }
}
