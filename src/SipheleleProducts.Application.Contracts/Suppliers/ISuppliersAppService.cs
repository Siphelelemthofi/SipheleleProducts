using SipheleleProducts.Suppliers.Dto;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace SipheleleProducts.Suppliers
{
    public interface ISuppliersAppService
    {
        Task<string> AddNewSupplier(AddNewSupplierDto addNewSupplierDto);
        Task<string> RemoveSupplierById(int ProductId);
        Task<string> UpdateSupplierById(UpdateSupplierByIdDto UpdateSupplierByIdDto);
        Task<List<GetAllSuppliersDto>> GetAllSuppliers();
        Task<int> CountAvailableSuppliers();
    }
}
