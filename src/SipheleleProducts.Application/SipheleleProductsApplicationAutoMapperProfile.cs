using AutoMapper;
using SipheleleProducts.Categories.Dto;
using SipheleleProducts.Categories.Entities;

namespace SipheleleProducts;

public class SipheleleProductsApplicationAutoMapperProfile : Profile
{
    public SipheleleProductsApplicationAutoMapperProfile()
    {
        CreateMap<AddNewCategoryDto, AddNewCategory>();
        CreateMap<GetListOfAllCatagories, GetListOfAllCatagoriesDto>();
    }
}
