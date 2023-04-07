using System;
using System.Collections.Generic;
using System.Text;

namespace SipheleleProducts.Products.Dto
{
    public class GetProductDetailsByIdDto :AddNewProductDto
    {
        public int ProductId { get; set; }
        public string CategoryName { get; set; } = string.Empty;
        public string CompanyName { get; set; } = string.Empty;
    }
}
