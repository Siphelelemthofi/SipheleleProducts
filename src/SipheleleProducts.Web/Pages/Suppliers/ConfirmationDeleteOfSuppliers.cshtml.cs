using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SipheleleProducts.Suppliers;
using System.Threading.Tasks;

namespace SipheleleProducts.Web.Pages.Suppliers
{
    public class ConfirmationDeleteOfSuppliersModel : SipheleleProductsPageModel
    {
        private readonly ISuppliersAppService _suppliersAppService;
        public void OnGet()
        {
        }
        public async Task<IActionResult> OnPost(int SupplierId)
        {
            await _suppliersAppService.RemoveSupplierById(SupplierId);
            return Page();
        }
    }
}
