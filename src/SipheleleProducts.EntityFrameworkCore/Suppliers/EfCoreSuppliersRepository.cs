using dut.SipheleleProducts.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using SipheleleProducts.EntityFrameworkCore;
using SipheleleProducts.Products;
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

namespace SipheleleProducts.Suppliers
{
    public class EfCoreSuppliersRepository : EfCoreRepository<SipheleleProductsDbContext, IEntity<Guid>>, ISuppliersRepository
    {
        public EfCoreSuppliersRepository(IDbContextProvider<SipheleleProductsDbContext> dbContextProvider) : base(dbContextProvider)
        {
        }
        public async Task<string> AddNewSupplier(AddNewSupplier addNewSupplyer, CancellationToken cancellationToken = default)
        {
            await RepositoryCommandAndConnection.EnsureConnectionOpenAsync(await GetDbContextAsync(),
            cancellationToken);
            SqlParameter[] sqlQueryParam =
            {
                new SqlParameter("@CompanyName", addNewSupplyer.CompanyName),
                new SqlParameter("@ContactName", addNewSupplyer.ContactName),
                new SqlParameter("@ContactTitle", addNewSupplyer.ContactTitle),
                new SqlParameter("@Address", addNewSupplyer.Address),
                new SqlParameter("@City", addNewSupplyer.City),
                new SqlParameter("@Region", addNewSupplyer.Region),
                new SqlParameter("@PostalCode", addNewSupplyer.PostalCode),
                new SqlParameter("@Country", addNewSupplyer.Country),
                new SqlParameter("@PhoneNumber", addNewSupplyer.PhoneNumber),
                new SqlParameter("@Fax", addNewSupplyer.Fax),
                new SqlParameter("@HomePage", addNewSupplyer.HomePage),

            };
            await using var command = RepositoryCommandAndConnection.CreateCommand(await GetDbContextAsync(), "AddNewSupplier", CommandType.StoredProcedure, sqlQueryParam);
            return (string?)await command.ExecuteScalarAsync(cancellationToken) ?? string.Empty;
        }
        public async Task<List<GetAllSuppliers>> GetAllSuppliers(CancellationToken cancellationToken = default)
        {
            await RepositoryCommandAndConnection.EnsureConnectionOpenAsync(await GetDbContextAsync(), cancellationToken);

            await using var command = RepositoryCommandAndConnection.CreateCommand(await GetDbContextAsync(),
            "GetAllSuppliers", CommandType.StoredProcedure);
            await using var dataReader = await command.ExecuteReaderAsync(cancellationToken);
            return await dataReader.MapToList<GetAllSuppliers>(cancellationToken);
        }
        public async Task UpdateSupplierById(UpdateSupplierById updateSupplyerById, CancellationToken cancellationToken = default)
        {
            await RepositoryCommandAndConnection.EnsureConnectionOpenAsync(await GetDbContextAsync(),
             cancellationToken);
            SqlParameter[] sqlQueryParam =
            {
                new SqlParameter("@SupplyerId", updateSupplyerById.SupplierId),
                new SqlParameter("@CompanyName", updateSupplyerById.CompanyName),
                new SqlParameter("@ContactName", updateSupplyerById.ContactName),
                new SqlParameter("@ContactTitle", updateSupplyerById.ContactTitle),
                new SqlParameter("@Address", updateSupplyerById.Address),
                new SqlParameter("@City", updateSupplyerById.City),
                new SqlParameter("@Region", updateSupplyerById.Region),
                new SqlParameter("@PostalCode", updateSupplyerById.PostalCode),
                new SqlParameter("@Country", updateSupplyerById.Country),
                new SqlParameter("@PhoneNumber", updateSupplyerById.PhoneNumber),
                new SqlParameter("@Fax", updateSupplyerById.Fax),
                new SqlParameter("@HomePage", updateSupplyerById.HomePage),
            };
            await using var command = RepositoryCommandAndConnection.CreateCommand(await GetDbContextAsync(), "UpdateSupplierById", CommandType.StoredProcedure, sqlQueryParam);
            await using var dataReader = await command.ExecuteReaderAsync(cancellationToken);
        }
        public async Task<string> RemoveSupplierById(int SuppliyerId, CancellationToken cancellationToken = default)
        {
            await RepositoryCommandAndConnection.EnsureConnectionOpenAsync(await GetDbContextAsync(), cancellationToken);
            SqlParameter[] sqlQueryParam =
            {
                new SqlParameter("@SupplierId", SuppliyerId),

            };
            await using var command = RepositoryCommandAndConnection.CreateCommand(await GetDbContextAsync(), "RemoveSupplierById", CommandType.StoredProcedure, sqlQueryParam);
            return (string?)await command.ExecuteScalarAsync(cancellationToken) ?? string.Empty;
        }
        public async Task<GetSupplierDetailsById> GetSuppliersDetailsById(int SupplierId,CancellationToken cancellationToken = default)
        {
            await RepositoryCommandAndConnection.EnsureConnectionOpenAsync(await GetDbContextAsync(), cancellationToken);
            SqlParameter[] sqlQueryParam =
            {
                new SqlParameter("@SupplierId",SupplierId),
            };

            await using var command = RepositoryCommandAndConnection.CreateCommand(await GetDbContextAsync(),
            "GetSupplierDetailsById", CommandType.StoredProcedure, sqlQueryParam);
            await using var dataReader = await command.ExecuteReaderAsync(cancellationToken);
            return await dataReader.MapToObject<GetSupplierDetailsById>(cancellationToken);
        }
    }
}
