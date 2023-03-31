using SipheleleProducts.Localization;
using Volo.Abp.AspNetCore.Mvc;

namespace SipheleleProducts.Controllers;

/* Inherit your controllers from this class.
 */
public abstract class SipheleleProductsController : AbpControllerBase
{
    protected SipheleleProductsController()
    {
        LocalizationResource = typeof(SipheleleProductsResource);
    }
}
