using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Text;

namespace SipheleleProducts.Products.Dto
{
    public class AddNewProductDto
    {
        public string ProductName { get; set; } = string.Empty;
        public int SupplierId { get; set; }
        public int CategoryId { get; set; }
        public float UnitPrice { get; set; }
        public int UnitInStock { get; set; }
        public int UnitOnOrder { get; set; }
        public IFormFile? Picture { get; set; }
        public string ImagePath { get; set; } = string.Empty;

    }
}
