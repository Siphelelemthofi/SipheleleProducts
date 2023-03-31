using SipheleleProducts.Localization;
using Volo.Abp.AspNetCore.Mvc.UI.RazorPages;

namespace SipheleleProducts.Web.Pages;

/* Inherit your PageModel classes from this class.
 */
public abstract class SipheleleProductsPageModel : AbpPageModel
{
    protected SipheleleProductsPageModel()
    {
        LocalizationResourceType = typeof(SipheleleProductsResource);
    }
}
