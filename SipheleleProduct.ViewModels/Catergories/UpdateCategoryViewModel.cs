using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace SipheleleProducts.ViewModels.Catergories
{
    public class UpdateCategoryViewModel  
    {
        public int CategoryId { get; set; }
        [Display(Name = "Category Name")]
        public string CategoryName { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public IFormFile? Picture { get; set; }
        public string ImagePath { get; set; } = string.Empty;
    }
}
