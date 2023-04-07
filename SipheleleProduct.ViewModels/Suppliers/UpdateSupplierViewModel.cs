using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SipheleleProducts.ViewModels.Suppliers
{
    public class UpdateSupplierViewModel
    {
        [Required]
        [Display(Name = "Supplier Name")]
        public int SupplierId { get; set; }
        [Required]
        [Display(Name = "Company Name")]
        public string CompanyName { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Contact Name")]
        public string ContactName { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Contact Title")]
        public string ContactTitle { get; set; } = string.Empty;
        [Required]
 
        public string Address { get; set; } = string.Empty;
        [Required]
 
        public string City { get; set; } = string.Empty;
        [Required]
 
        public string Region { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Postal Code")]
        public string PostalCode { get; set; } = string.Empty;
        [Required]
       
        public string Country { get; set; } = string.Empty;
        [Required]
        [MaxLength(10)]
        [Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; } = string.Empty;
        [Required]
        [MaxLength(10)]
        public string Fax { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Home Page")]
        public string HomePage { get; set; } = string.Empty;
    
    }
}
