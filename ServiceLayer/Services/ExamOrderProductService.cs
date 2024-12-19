using ServiceLayer.Models;
using System.Net.Http.Json;

namespace ServiceLayer.Services
{
    public class ExamOrderProductService
    {
        private readonly HttpClient _client;
        private readonly string _baseAddress = "http://localhost:5114/api/";

        public ExamOrderProductService()
        {
            _client = new() { BaseAddress = new Uri(_baseAddress) };
        }

        public async Task<List<ExamOrderProduct>> GetProductsInOrder(int? orderId)
        {
            var orderProducts = await GetOrderProducts();
            return orderProducts.Where(op => op.OrderId == orderId).ToList();
        }

        private async Task<List<ExamOrderProduct>?> GetOrderProducts()
        {
            return await _client.GetFromJsonAsync<List<ExamOrderProduct>>("ExamOrderProducts");
        }

        public async Task<string> GetProductAmountInOrderWithArticle(int? orderId, string article)
        {
            var orderProducts = await GetOrderProducts();
            return orderProducts.Where(o => o.OrderId == orderId && o.ProductArticleNumber == article).Select(o => o.Amount).FirstOrDefault().ToString();
        }


        public async Task<decimal?> GetSumOrder(int? orderId)//получение суммы заказа
        {
            var response = await _client.GetAsync($"ExamOrderProducts/{orderId}/summ");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<decimal?>();
        }

        public async Task<decimal?> GetDiscountOrder(int? orderId)//получение скидки заказа
        {
            var response = await _client.GetAsync($"ExamOrderProducts/{orderId}/discount");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<decimal?>();
        }

        public async Task AddOrderProductAsync(int? orderID, string productArticleNumber, int amount)//создание новых записей о товарах в новом заказе
        {
            var orderProduct = new ExamOrderProduct() { OrderId = orderID, ProductArticleNumber = productArticleNumber, Amount = (short)amount };
            var response = await _client.PostAsJsonAsync("ExamOrderProducts", orderProduct);
            response.EnsureSuccessStatusCode();
        }
    }
}
