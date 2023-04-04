using AutoMapper;
using SipheleleProducts.Categories.Dto;
using SipheleleProducts.Products.Dto;
using SipheleleProducts.Suppliers.Dto;
using SipheleleProducts.ViewModels.Catergories;
using SipheleleProducts.ViewModels.Products;
using SipheleleProducts.ViewModels.Suppliers;

namespace SipheleleProducts.Web;

public class SipheleleProductsWebAutoMapperProfile : Profile
{
    public SipheleleProductsWebAutoMapperProfile()
    {
        //Define your AutoMapper configuration here for the Web project.
        CreateMap<AddNewCategoryViewModel, AddNewCategoryDto>();
        CreateMap<GetAllProductDto,GetAllProductViewModel>();
        CreateMap<GetListOfAllCatagoriesDto,GetListOfAllCatagoriesViewModel>();
        CreateMap<GetAllSuppliersDto, GetAllSuppliersViewModel>();
        CreateMap<AddNewCategoryViewModel, AddNewCategoryDto>();
        CreateMap<AddNewSupplierViewModel, AddNewSupplierDto>();
        CreateMap <GetCategoryDetaislByCategoryByIdDto, GetCategoryDetaislByCategoryByIdViewModel> ();
        CreateMap<UpdateCategoryViewModel, UpdateCategoryDto>();
    }
}
