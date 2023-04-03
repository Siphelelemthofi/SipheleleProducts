using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SipheleleProducts.Products.Manager
{
    public class ProductsManager
    {
        private readonly IProductsRepository _productsRepository;
        public ProductsManager(IProductsRepository productsRepository) { 
        
        _productsRepository = productsRepository;   
        } 
        public async Task<int> CountAllProducts()
        {
            var GetProducts = await _productsRepository.GetAllProducts();
            return GetProducts.Count();
        }
    }
}
