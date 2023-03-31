﻿using SipheleleProducts.Categories.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace SipheleleProducts.Categories
{
    public interface ICategoriesRepository
    {
        Task<Guid> AddNewCatagory(AddNewCategory addNewCategorys, CancellationToken cancellationToken = default);
        Task<List<GetListOfAllCatagories>> GetAllCategories(CancellationToken cancellationToken = default);
    }
}