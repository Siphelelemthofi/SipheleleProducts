using SipheleleProducts.Localization;
using Volo.Abp.Authorization.Permissions;
using Volo.Abp.Localization;

namespace SipheleleProducts.Permissions;

public class SipheleleProductsPermissionDefinitionProvider : PermissionDefinitionProvider
{
    public override void Define(IPermissionDefinitionContext context)
    {
        var myGroup = context.AddGroup(SipheleleProductsPermissions.GroupName);
        //Define your own permissions here. Example:
        //myGroup.AddPermission(SipheleleProductsPermissions.MyPermission1, L("Permission:MyPermission1"));
    }

    private static LocalizableString L(string name)
    {
        return LocalizableString.Create<SipheleleProductsResource>(name);
    }
}
