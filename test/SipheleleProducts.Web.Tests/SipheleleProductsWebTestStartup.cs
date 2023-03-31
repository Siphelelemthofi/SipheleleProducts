using System;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Volo.Abp;

namespace SipheleleProducts;

public class SipheleleProductsWebTestStartup
{
    public void ConfigureServices(IServiceCollection services)
    {
        services.AddApplication<SipheleleProductsWebTestModule>();
    }

    public void Configure(IApplicationBuilder app, ILoggerFactory loggerFactory)
    {
        app.InitializeApplication();
    }
}
