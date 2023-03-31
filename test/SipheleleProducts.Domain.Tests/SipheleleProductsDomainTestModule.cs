using SipheleleProducts.EntityFrameworkCore;
using Volo.Abp.Modularity;

namespace SipheleleProducts;

[DependsOn(
    typeof(SipheleleProductsEntityFrameworkCoreTestModule)
    )]
public class SipheleleProductsDomainTestModule : AbpModule
{

}
