using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SipheleleProducts.Products.Entities
{
    public class AddNewProduct
    {
        public string ProductName { get; set; } = string.Empty;
        public int SupplierId { get; set; } 
        public int CategoryId { get; set; } 
        public float UnitPrice { get; set; }
        public int UnitInStock { get; set; }
        public string ImagePath { get; set; } = string.Empty;
        public IFormFile? Picture { get; set; }
    }
}
