﻿ 
using dut.SipheleleProducts.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using SipheleleProducts.Categories.Entities;
using SipheleleProducts.EntityFrameworkCore;
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

namespace SipheleleProducts.Categories
{
    public class EfCoreCategoriesRepository : EfCoreRepository<SipheleleProductsDbContext, IEntity<Guid>>, ICategoriesRepository
    {
        public EfCoreCategoriesRepository(IDbContextProvider<SipheleleProductsDbContext> dbContextProvider) : base(dbContextProvider)
        {
        }
        public async Task<Guid> AddNewCatagory(AddNewCategory addNewCategorys, CancellationToken cancellationToken = default)
        {
            await RepositoryCommandAndConnection.EnsureConnectionOpenAsync(await GetDbContextAsync(),
             cancellationToken);
            SqlParameter[] sqlQueryParam =
            {
                new SqlParameter("@CategoryName", addNewCategorys.CategoryName),
                new SqlParameter("@Description", addNewCategorys.Description),
                new SqlParameter("@Picture", addNewCategorys.Picture),
            };
            await using var command = RepositoryCommandAndConnection.CreateCommand(await GetDbContextAsync(), "AddNewCategory", CommandType.StoredProcedure, sqlQueryParam);
            return (Guid?)await command.ExecuteScalarAsync(cancellationToken) ?? Guid.Empty;
        }
        public async Task<List<GetListOfAllCatagories>> GetAllCategories(CancellationToken cancellationToken = default)
        {
            await RepositoryCommandAndConnection.EnsureConnectionOpenAsync(await GetDbContextAsync(),cancellationToken);
         
            await using var command = RepositoryCommandAndConnection.CreateCommand(await GetDbContextAsync(),
            "GetAllCatagories", CommandType.StoredProcedure);
            await using var dataReader = await command.ExecuteReaderAsync(cancellationToken);
           return await dataReader.MapToList<GetListOfAllCatagories>(cancellationToken);
        }
    }
}