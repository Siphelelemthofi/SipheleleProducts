﻿using System;
using System.Collections.Generic;
using System.Text;

namespace SipheleleProducts.Categories.Dto
{
    public class AddNewCategoryDto
    {
        public string CategoryName { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string Picture { get; set; } = string.Empty;
    }
}
