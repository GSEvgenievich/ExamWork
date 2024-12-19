using ServiceLayer.DTOs;
using ServiceLayer.Models;
using System.Net.Http.Json;

namespace ServiceLayer.Services
{
    public class ExamOrderService
    {
        private readonly HttpClient _client;
        private readonly string _baseAddress = "http://localhost:5114/api/";

        public ExamOrderService()
        {
            _client = new() { BaseAddress = new Uri(_baseAddress) };
        }

        public async Task<OrderSummaryDTO> GetOrderByIdWithTotalCostAsync(int id)//получение заказа из БД по id
        {
            var response = await _client.GetAsync($"ExamOrders/{id}/TotalCost");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<OrderSummaryDTO>();
        }

        public async Task<ExamOrder> GetOrderByIdAsync(int? id)//получение заказа из БД по id
        {
            var response = await _client.GetAsync($"ExamOrders/{id}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<ExamOrder>();
        }

        public async Task<List<ExamOrder>> GetOrders()//получение заказов
        {
            return await _client.GetFromJsonAsync<List<ExamOrder>>("ExamOrders");
        }

        public async Task<List<OrderSummaryDTO>> GetOrdersWithTotalCost()//получение заказов
        {
            return await _client.GetFromJsonAsync<List<OrderSummaryDTO>>("ExamOrders/TotalCost");
        }

        public async Task UpdateExamOrderStatus(string newStatus, int orderId)
        {
            var order = await GetOrderByIdAsync(orderId);
            order.OrderStatus = newStatus;
            var response = await _client.PutAsJsonAsync($"ExamOrders/{orderId}", order);
            response.EnsureSuccessStatusCode();
        }

        public async Task UpdateExamOrderDeliveryDate(DateTime newDeliveryDate, int orderId)
        {
            var order = await GetOrderByIdAsync(orderId);
            order.OrderDeliveryDate = newDeliveryDate;
            var response = await _client.PutAsJsonAsync($"ExamOrders/{orderId}", order);
            response.EnsureSuccessStatusCode();
        }

        public async Task<List<int>> GetExistingPickupCodesAsync()//получение существующих кодов заказов, чтобы не было повторений
        {
            var orders = await GetOrdersWithTotalCost();
            return orders.Select(o => o.OrderPickupCode).ToList();
        }

        public async Task AddExamOrderAsync(int? userID, string orderStatus, DateTime orderDate, DateTime orderDeliveryDate, int orderPickupPoint, int orderPickupCode)//создание нового заказа в БД
        {
            var newOrder = new ExamOrder() { UserId = userID != 0 ? userID : null, OrderStatus = orderStatus, OrderDate = orderDate, OrderDeliveryDate = orderDeliveryDate, OrderPickupPoint = orderPickupPoint, OrderPickupCode = orderPickupCode };
            var response = await _client.PostAsJsonAsync("ExamOrders", newOrder);
            response.EnsureSuccessStatusCode();
        }
        public async Task<ExamOrder> GetLastOrderAsync()//получение списка заказов одного пользователя из БД
        {
            var orders = await GetOrders();
            var lastId = orders.Max(o => o.OrderId);
            return await GetOrderByIdAsync(lastId);
        }

        public async Task<List<ExamOrder>> GetOrdersByUserIdAsync(int id)//получение списка заказов одного пользователя из БД
        {
            var orders = await GetOrders();
            return orders.Where(o => o.UserId == id).ToList();
        }
    }
}
