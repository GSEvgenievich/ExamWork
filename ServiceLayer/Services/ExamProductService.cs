using ServiceLayer.DTOs;
using ServiceLayer.Models;
using System.Net.Http.Json;

namespace ServiceLayer.Services
{
    public class ExamProductService
    {
        private readonly HttpClient _client;
        private readonly string _baseAddress = "http://localhost:5114/api/";

        public ExamProductService()
        {
            _client = new() { BaseAddress = new Uri(_baseAddress) };
        }
        public async Task<List<ProductDTO>> GetProductsAsync(string subs, string? sortMethod, decimal minCost, decimal? maxCost, string manuf)//получение списка продуктов из БД с фильтрацией
        {
            var productList = await _client.GetFromJsonAsync<IEnumerable<ProductDTO>>("ExamProducts");
            productList = productList.Where(p => p.TotalCost >= minCost).Where(p => p.ProductName.ToLower().Contains(subs.ToLower()));

            if (maxCost != null)
            {
                productList = productList.Where(p => p.TotalCost <= maxCost);
            }

            if (!string.IsNullOrEmpty(manuf))
            {
                productList = productList.Where(p => p.ProductManufacturer == manuf);
            }

            if (sortMethod == "asc")
            {
                return productList.OrderBy(x => x.TotalCost).ToList();
            }
            else if (sortMethod == "desc")
            {
                return productList.OrderByDescending(x => x.TotalCost).ToList();
            }
            return productList.ToList();
        }

        public async Task<int> GetProductsCountAsync()
        {
            var allProducts = await GetProductsAsync("", "", 0, null, "");
            return allProducts.Count;
        }

        public async Task<List<string>> GetManufacturersAsync()
        {
            var manufacterers = await _client.GetFromJsonAsync<IEnumerable<ExamManufacturer>>("ExamManufacturers");
            List<string> manufacturers = ["Все производители", .. manufacterers.Select(p => p.Name).Distinct().ToList()];
            return manufacturers;
        }

        public async Task<string> GetProductNameByArticleAsync(string article)
        {
            var manufacterers = await _client.GetFromJsonAsync<IEnumerable<ExamProduct>>("ExamProducts");
            return manufacterers.Where(p => p.ProductArticleNumber == article).Select(p => p.ProductName).FirstOrDefault();
        }
    }
}
