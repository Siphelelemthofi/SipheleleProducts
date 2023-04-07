using Microsoft.AspNetCore.Mvc;
using SipheleleProducts.Categories;
using SipheleleProducts.Products;
using SipheleleProducts.Suppliers;
using System.Threading.Tasks;

namespace SipheleleProducts.Web.Pages;

public class IndexModel : SipheleleProductsPageModel
{
    [BindProperty]
    public int TotalNUmberOfCategories { get; set; }
    [BindProperty]
    public int TotalNUmberOfProducts { get; set; }
    [BindProperty]
    public int TotalNumberOfSuppliers { get; set; }
    private readonly ICategoriesAppService _categoriesAppService;

    private readonly IProductsAppService  _productsAppService;

    private readonly ISuppliersAppService _suppliersAppService;
    public IndexModel(ICategoriesAppService categoriesAppService,IProductsAppService productsAppService,ISuppliersAppService suppliersAppService) { 
        _categoriesAppService = categoriesAppService;
         _productsAppService = productsAppService;   
        _suppliersAppService = suppliersAppService;
    }
    public async void OnGet()
    {
        //TotalNUmberOfCategories = await _categoriesAppService.CountAvailbleCategories();
        //TotalNUmberOfProducts = await _productsAppService.CountTotalNumberOfProducts();
        //TotalNumberOfSuppliers = await _suppliersAppService.CountAvailableSuppliers();

    }
}
