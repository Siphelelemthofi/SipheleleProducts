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
            var GetProducts = await _supplierssRepository.GetAllSuppliers();
            return ObjectMapper.Map<List<GetAllSuppliers>, List<GetAllSuppliersDto>>(GetProducts);
        }
        public async Task<string> UpdateSupplierById(UpdateSupplierByIdDto UpdateSupplierByIdDto)
        {
            var UpdateCategory = ObjectMapper.Map<UpdateSupplierByIdDto, UpdateSupplierById>(UpdateSupplierByIdDto);
            return await _supplierssRepository.UpdateSupplierById(UpdateCategory);
        }
        public async Task<string> RemoveSupplierById(int ProductId)
        {
            return await _supplierssRepository.RemoveSupplierById(ProductId);

        }
    }
}
