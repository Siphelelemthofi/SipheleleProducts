using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SipheleleProducts.Categories.Entities
{
    public class AddNewCategory
    {
        public string CategoryName { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty; 
        public IFormFile? Picture { get; set; }
        public string ImagePath { get; set; } = string.Empty;
    }
}
