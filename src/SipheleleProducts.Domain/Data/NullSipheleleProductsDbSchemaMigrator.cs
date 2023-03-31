using System.Threading.Tasks;
using Volo.Abp.DependencyInjection;

namespace SipheleleProducts.Data;

/* This is used if database provider does't define
 * ISipheleleProductsDbSchemaMigrator implementation.
 */
public class NullSipheleleProductsDbSchemaMigrator : ISipheleleProductsDbSchemaMigrator, ITransientDependency
{
    public Task MigrateAsync()
    {
        return Task.CompletedTask;
    }
}
