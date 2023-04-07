using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace SipheleleProducts.ViewModels.Products
{
    public class UpdateProductViewModel 
    {
        public int ProductId { get; set; }
        public string CategoryName { get; set; } = string.Empty;
        public string CompanyName { get; set; } = string.Empty;
        [Display(Name = "Product Name")]
        public string ProductName { get; set; } = string.Empty;
        public int SupplierId { get; set; }
        public int CategoryId { get; set; }
        [Display(Name = "Unit Price")]
        public float UnitPrice { get; set; }
        [Display(Name = "Stock")]
        public int UnitInStock { get; set; }
        public int UnitOnOrder { get; set; }
        public string ImagePath { get; set; } = string.Empty;
        public IFormFile? Picture { get; set; }
    }
}
