using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SipheleleProducts.ViewModels.Products
{
    public class AddNewProductViewModel
    {
        [Required]
        [Display(Name = "Product Name")]
        public string ProductName { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Supplier Name")]
        public int SupplierId { get; set; }
        [Required]
        [Display(Name = "Category Name")]
        public int CategoryId { get; set; }
        [Required]
        [Display(Name = "Price Unit")]
        public float UnitPrice { get; set; }
        [Required]
        [Display(Name = "Stock Unit")]
        public int UnitInStock { get; set; }
        [Required]
        [Display(Name = "Order Unit")]
        public int UnitOnOrder { get; set; }
        [Required]
        public IFormFile? Picture { get; set; }
        public string ImagePath { get; set; } = string.Empty;
    }
}
