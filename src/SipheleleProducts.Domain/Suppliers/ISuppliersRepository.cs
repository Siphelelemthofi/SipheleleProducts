using SipheleleProducts.Suppliers.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace SipheleleProducts.Suppliers
{
    public interface ISuppliersRepository
    {
        Task<string> RemoveSupplierById(int SuppliyerId, CancellationToken cancellationToken = default);
        Task<List<GetAllSuppliers>> GetAllSuppliers(CancellationToken cancellationToken = default);
        Task  UpdateSupplierById(UpdateSupplierById updateSupplyerById, CancellationToken cancellationToken = default);
        Task<string> AddNewSupplier(AddNewSupplier addNewSupplyer, CancellationToken cancellationToken = default);
        Task<GetSupplierDetailsById> GetSuppliersDetailsById(int SupplierId, CancellationToken cancellationToken = default);
    }
}
