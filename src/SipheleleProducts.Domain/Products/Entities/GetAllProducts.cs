using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SipheleleProducts.Products.Entities
{
    public class GetAllProducts  
    {
        public int ProductId { get; set; }
        public string CategoryName { get; set; } = string.Empty;
        public string CompanyName { get; set; } = string.Empty;
        public string ProductName { get; set; } = string.Empty;
        public int SupplierId { get; set; }
        public int CategoryId { get; set; }
        public float UnitPrice { get; set; }
        public int UnitInStock { get; set; }
        public string ImagePath { get; set; } = string.Empty;
    }
}
