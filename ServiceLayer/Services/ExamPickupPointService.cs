using ServiceLayer.Models;
using System.Net.Http.Json;

namespace ServiceLayer.Services
{
    public class ExamPickupPointService
    {
        private readonly HttpClient _client;
        private readonly string _baseAddress = "http://localhost:5114/api/";

        public ExamPickupPointService()
        {
            _client = new() { BaseAddress = new Uri(_baseAddress) };
        }

        public async Task<List<ExamPickupPoint>?> GetPickupPointsAsync()//получение списка пунктов выдачи из БД
        {
            return await _client.GetFromJsonAsync<List<ExamPickupPoint>>("ExamPickupPoints");
        }
    }
}
