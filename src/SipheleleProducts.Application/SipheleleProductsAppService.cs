using System;
using System.Collections.Generic;
using System.Text;
using SipheleleProducts.Localization;
using Volo.Abp.Application.Services;

namespace SipheleleProducts;

/* Inherit your application services from this class.
 */
public abstract class SipheleleProductsAppService : ApplicationService
{
    protected SipheleleProductsAppService()
    {
        LocalizationResource = typeof(SipheleleProductsResource);
    }
}
