using System.Threading.Tasks;
using Shouldly;
using Xunit;

namespace SipheleleProducts.Pages;

public class Index_Tests : SipheleleProductsWebTestBase
{
    [Fact]
    public async Task Welcome_Page()
    {
        var response = await GetResponseAsStringAsync("/");
        response.ShouldNotBeNull();
    }
}
