using System;
using System.Collections.Generic;
using System.Text;

namespace SipheleleProducts.Categories.Dto
{
    public class GetListOfAllCatagoriesDto
    {
        public int CategoryId { get; set; }
        public string ImagePath { get; set; } = string.Empty;
        public string CategoryName { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
    }
}
