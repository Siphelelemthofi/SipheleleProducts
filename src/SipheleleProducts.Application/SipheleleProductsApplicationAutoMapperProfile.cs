using AutoMapper;
using SipheleleProducts.Categories.Dto;
using SipheleleProducts.Categories.Entities;
using SipheleleProducts.Products.Dto;
using SipheleleProducts.Products.Entities;
using SipheleleProducts.Suppliers.Dto;
using SipheleleProducts.Suppliers.Entities;

namespace SipheleleProducts;

public class SipheleleProductsApplicationAutoMapperProfile : Profile
{
    public SipheleleProductsApplicationAutoMapperProfile()
    {
        CreateMap<AddNewCategoryDto, AddNewCategory>();
        CreateMap<GetListOfAllCatagories, GetListOfAllCatagoriesDto>();
        CreateMap<UpdateProductByIdDto, UpdateProduct>();
        CreateMap<GetAllProducts, GetAllProductDto>();
        CreateMap<AddNewProductDto, AddNewProduct>();
        CreateMap<AddNewSupplierDto, AddNewSupplier>();
        CreateMap <UpdateSupplierByIdDto, UpdateSupplierById> ();
        CreateMap<GetAllSuppliers,GetAllSuppliersDto>();
        CreateMap<UpdateCategoryDto, UpdateCategory>();
        CreateMap<GetCategoryDetaislByCategoryById, GetCategoryDetaislByCategoryByIdDto>();
    }
}
