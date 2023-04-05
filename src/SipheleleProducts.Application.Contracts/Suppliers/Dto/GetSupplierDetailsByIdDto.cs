using System;
using System.Collections.Generic;
using System.Text;

namespace SipheleleProducts.Suppliers.Dto
{
    public class GetSupplierDetailsByIdDto :AddNewSupplierDto
    {
        public int SupplierId { get; set; }
    }
}
