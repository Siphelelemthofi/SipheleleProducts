using AutoMapper.Internal.Mappers;
using SipheleleProducts.Products.Dto;
using SipheleleProducts.Products.Entities;
using SipheleleProducts.Products;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SipheleleProducts.Suppliers.Dto;
using Volo.Abp.ObjectMapping;
using SipheleleProducts.Suppliers.Entities;
using SipheleleProducts.Categories.Dto;
using SipheleleProducts.Categories.Entities;

namespace SipheleleProducts.Suppliers
{
    public class SuppliersAppService : SipheleleProductsAppService, ISuppliersAppService
    {
        private readonly ISuppliersRepository _supplierssRepository;
        public SuppliersAppService(ISuppliersRepository supplierssRepository)
        {
            _supplierssRepository = supplierssRepository;
        }

        public async Task<string> AddNewSupplier(AddNewSupplierDto addNewSupplierDto)
        {
            return await _supplierssRepository.AddNewSupplier(ObjectMapper.Map<AddNewSupplierDto, AddNewSupplier>(addNewSupplierDto));
        }
        public async Task<List<GetAllSuppliersDto>> GetAllSuppliers()
        {
            var GetSuppliers = await _supplierssRepository.GetAllSuppliers();
            return ObjectMapper.Map<List<GetAllSuppliers>, List<GetAllSuppliersDto>>(GetSuppliers);
        }
        public async Task UpdateSupplierById(UpdateSupplierByIdDto UpdateSupplierByIdDto)
        {
            var UpdateCategory = ObjectMapper.Map<UpdateSupplierByIdDto, UpdateSupplierById>(UpdateSupplierByIdDto);
             await _supplierssRepository.UpdateSupplierById(UpdateCategory);
        }
        public async Task<string> RemoveSupplierById(int ProductId)
        {
            return await _supplierssRepository.RemoveSupplierById(ProductId);

        }
        public async Task<int> CountAvailableSuppliers()
        {
            var CountAllSuppliers = await GetAllSuppliers();    
            return CountAllSuppliers.Count();
        }
        public async Task<GetSupplierDetailsByIdDto> GetSuppliersDetailsById(int SupplierId)
        {
            var getCatagoryByCategoryId = await _supplierssRepository.GetSuppliersDetailsById(SupplierId);
            return ObjectMapper.Map<GetSupplierDetailsById, GetSupplierDetailsByIdDto>(getCatagoryByCategoryId);
        }
    }
}
