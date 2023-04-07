using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SipheleleProducts.ViewModels.Products
{
    public class GetAllProductViewModel:AddNewProductViewModel
    {
        public int ProductId { get; set; }
        public string CategoryName { get; set; } = string.Empty;
        public string CompanyName { get; set; } = string.Empty;
    }
}
