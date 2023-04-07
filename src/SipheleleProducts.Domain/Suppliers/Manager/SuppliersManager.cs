using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Domain.Services;

namespace SipheleleProducts.Suppliers.Manager
{
    public class SuppliersManager : DomainService
    {
        private readonly ISuppliersRepository _suppliersRepository;
        public SuppliersManager(ISuppliersRepository suppliersRepository) { 
        _suppliersRepository = suppliersRepository;
        }
        public async Task<int> CountAllSuppliers()
        {
            var GetAllSuppliers = await _suppliersRepository.GetAllSuppliers();
            return GetAllSuppliers.Count(); 
        }
        public async Task<bool> CheckDuplicate(string ComapanyName)
        {
            var GetAllSuppliers = await _suppliersRepository.GetAllSuppliers();
            var GetAllComapanyName = from Suppliers in GetAllSuppliers where(Suppliers.CompanyName.Equals(ComapanyName)) select Suppliers;
            if(GetAllComapanyName is null)
                return false;
            return true;
        }
    }
}
