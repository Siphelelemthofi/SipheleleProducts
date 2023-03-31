using Volo.Abp.Ui.Branding;
using Volo.Abp.DependencyInjection;

namespace SipheleleProducts.Web;

[Dependency(ReplaceServices = true)]
public class SipheleleProductsBrandingProvider : DefaultBrandingProvider
{
    public override string AppName => "SipheleleProducts";
}
