using Volo.Abp.Modularity;

namespace SipheleleProducts;

[DependsOn(
    typeof(SipheleleProductsApplicationModule),
    typeof(SipheleleProductsDomainTestModule)
    )]
public class SipheleleProductsApplicationTestModule : AbpModule
{

}
