using SipheleleProducts.EntityFrameworkCore;
using Volo.Abp.Autofac;
using Volo.Abp.Modularity;

namespace SipheleleProducts.DbMigrator;

[DependsOn(
    typeof(AbpAutofacModule),
    typeof(SipheleleProductsEntityFrameworkCoreModule),
    typeof(SipheleleProductsApplicationContractsModule)
    )]
public class SipheleleProductsDbMigratorModule : AbpModule
{

}
