using System;
using System.IO;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;

namespace SipheleleProducts.EntityFrameworkCore;

/* This class is needed for EF Core console commands
 * (like Add-Migration and Update-Database commands) */
public class SipheleleProductsDbContextFactory : IDesignTimeDbContextFactory<SipheleleProductsDbContext>
{
    public SipheleleProductsDbContext CreateDbContext(string[] args)
    {
        SipheleleProductsEfCoreEntityExtensionMappings.Configure();

        var configuration = BuildConfiguration();

        var builder = new DbContextOptionsBuilder<SipheleleProductsDbContext>()
            .UseSqlServer(configuration.GetConnectionString("Default"));

        return new SipheleleProductsDbContext(builder.Options);
    }

    private static IConfigurationRoot BuildConfiguration()
    {
        var builder = new ConfigurationBuilder()
            .SetBasePath(Path.Combine(Directory.GetCurrentDirectory(), "../SipheleleProducts.DbMigrator/"))
            .AddJsonFile("appsettings.json", optional: false);

        return builder.Build();
    }
}
