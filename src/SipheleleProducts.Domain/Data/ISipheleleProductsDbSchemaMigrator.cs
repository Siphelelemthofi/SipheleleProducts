using System.Threading.Tasks;

namespace SipheleleProducts.Data;

public interface ISipheleleProductsDbSchemaMigrator
{
    Task MigrateAsync();
}
