using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SipheleleProducts.ViewModels.Suppliers
{
    public class UpdateSupplierViewModel
    {
        public int SupplierId { get; set; }

        public string CompanyName { get; set; } = string.Empty;
        public string ContactName { get; set; } = string.Empty;
        public string ContactTitle { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public string City { get; set; } = string.Empty;
        public string Region { get; set; } = string.Empty;

        public string PostalCode { get; set; } = string.Empty;
        public string Country { get; set; } = string.Empty;

        public string PhoneNumber { get; set; } = string.Empty;
        public string Fax { get; set; } = string.Empty;
        public string HomePage { get; set; } = string.Empty;
    
    }
}
