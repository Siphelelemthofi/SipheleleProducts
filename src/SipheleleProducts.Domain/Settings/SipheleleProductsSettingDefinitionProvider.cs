using Volo.Abp.Settings;

namespace SipheleleProducts.Settings;

public class SipheleleProductsSettingDefinitionProvider : SettingDefinitionProvider
{
    public override void Define(ISettingDefinitionContext context)
    {
        //Define your own settings here. Example:
        //context.Add(new SettingDefinition(SipheleleProductsSettings.MySetting1));
    }
}
