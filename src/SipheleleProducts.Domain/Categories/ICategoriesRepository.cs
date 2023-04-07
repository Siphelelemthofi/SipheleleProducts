using SipheleleProducts.Categories.Entities;
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
        Task  AddNewCatagory(AddNewCategory addNewCategorys, CancellationToken cancellationToken = default);
        Task<List<GetListOfAllCatagories>> GetAllCategories(CancellationToken cancellationToken = default);
        Task UpdateCategoryById(UpdateCategory updateCategory, CancellationToken cancellationToken = default);
        Task<string> DeleteCategoryById(int CategoryId, CancellationToken cancellationToken = default);

        Task<GetCategoryDetaislByCategoryById> GetCategoryDetaislByCategoryById(int CategoryId, CancellationToken cancellationToken = default);
    }
}
