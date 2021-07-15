using NobleCause.SavijSellApi.Models.Api;
using System.Collections.Generic;

namespace NobleCause.SavijSellApi.Repositories
{
    public class ProductsRepository : IProductsRepository
    {
        public List<Product> GetProducts()
        {
            var products = new List<Product>();

            products.Add(new Product
            {
                Id = 1,
                Title = "Black Bag",
                Description = "A black bag - nice!",
                Image = $"/assets/images/1.jpg",
                Location = $"{LoremNETCore.Generate.Words(1)},{LoremNETCore.Generate.Random<string>(new string[] { "FL", "NC" })}",
                Price = 50m
            });
            products.Add(new Product
            {
                Id = 2,
                Title = "Blue Shirt",
                Description = "A blue t-shirt",
                Image = $"/assets/images/2.jpg",
                Location = $"{LoremNETCore.Generate.Words(1)},{LoremNETCore.Generate.Random<string>(new string[] { "FL", "NC" })}",
                Price = 15m
            });
            products.Add(new Product
            {
                Id = 3,
                Title = "Blue Earings",
                Description = "Light blue earings for your ear or other places....",
                Image = $"/assets/images/3.jpg",
                Location = $"{LoremNETCore.Generate.Words(1)},{LoremNETCore.Generate.Random<string>(new string[] { "FL", "NC" })}",
                Price = 150m
            });
            products.Add(new Product
            {
                Id = 4,
                Title = "Deep Blue Earings",
                Description = "Deep blue earings",
                Image = $"/assets/images/4.jpg",
                Location = $"{LoremNETCore.Generate.Words(1)},{LoremNETCore.Generate.Random<string>(new string[] { "FL", "NC" })}",
                Price = 50m
            });
            products.Add(new Product
            {
                Id = 5,
                Title = "Watch",
                Description = "Nice watch at a good price",
                Image = $"/assets/images/5.jpg",
                Location = $"{LoremNETCore.Generate.Words(1)},{LoremNETCore.Generate.Random<string>(new string[] { "FL", "NC" })}",
                Price = 50m
            });
            products.Add(new Product
            {
                Id = 6,
                Title = "Doge - Pug",
                Description = "This dog could be yours (pees on bed)",
                Image = $"/assets/images/6.jpg",
                Location = $"{LoremNETCore.Generate.Words(1)},{LoremNETCore.Generate.Random<string>(new string[] { "FL", "NC" })}",
                Price = 200m
            });
            products.Add(new Product
            {
                Id = 7,
                Title = "Necklace",
                Description = "Costume jewelry, hey what do you want for this price...",
                Image = $"/assets/images/7.jpg",
                Location = $"{LoremNETCore.Generate.Words(1)},{LoremNETCore.Generate.Random<string>(new string[] { "FL", "NC" })}",
                Price = 75m
            });
            products.Add(new Product
            {
                Id = 8,
                Title = "Red Shirt",
                Description = "A new red tee",
                Image = $"/assets/images/1.jpg",
                Location = $"{LoremNETCore.Generate.Words(1)},{LoremNETCore.Generate.Random<string>(new string[] { "FL", "NC" })}",
                Price = 5m
            });
            products.Add(new Product
            {
                Id = 9,
                Title = "Bracelets",
                Description = "Buy this bracelet today!",
                Image = $"/assets/images/9.jpg",
                Location = $"{LoremNETCore.Generate.Words(1)},{LoremNETCore.Generate.Random<string>(new string[] { "FL", "NC" })}",
                Price = 5m
            });
            return products;
        }
    }
}
