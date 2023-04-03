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
    public int TotalNUmberOfProductss { get; set; }
    [BindProperty]
    public int TotalNUmberOfSupplierss { get; set; }
    private readonly ICategoriesAppService _categoriesAppService;

    private readonly IProductsAppService  _productsAppService;

    private readonly ISuppliersAppService _suppliersAppService;
    public IndexModel(ICategoriesAppService categoriesAppService,IProductsAppService productsAppService,ISuppliersAppService suppliersAppService) { 
        _categoriesAppService = categoriesAppService;
         _productsAppService = productsAppService;   
        _suppliersAppService = suppliersAppService;
    }
    public void OnGet()
    {
    

    }
}
