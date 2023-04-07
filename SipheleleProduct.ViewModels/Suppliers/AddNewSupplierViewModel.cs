using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace SipheleleProducts.ViewModels.Suppliers
{
    public class AddNewSupplierViewModel
    {
        [Required]
        [Display(Name = "Product Name")]
        public string CompanyName { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Contact Name")]
        public string ContactName { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Contact Title")]
        public string ContactTitle { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Address")]
        public string Address { get; set; } = string.Empty;
        [Required]
        [Display(Name = "City")]
        public string City { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Region")]
 
        public string Region { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Postal Code")]
        [MaxLength(10)]
        [MinLength(4)]

        public string PostalCode { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Country ")]
        public string Country { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Phone Number")]
        [MaxLength(10)]
        [MinLength(10)]
        public string PhoneNumber { get; set; } = string.Empty;
        [MaxLength(10)]
        [MinLength(10)]
        public string Fax { get; set; } = string.Empty;
        public string HomePage { get; set; } = string.Empty;

    }
}
