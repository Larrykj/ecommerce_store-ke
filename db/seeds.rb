# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
Product.destroy_all

# Create sample products
Product.create!(
  name: "Wireless Headphones",
  description: "High-quality wireless headphones with noise cancellation and 30-hour battery life.",
  price: 4999.99,
  quantity: 15
)

Product.create!(
  name: "USB-C Cable",
  description: "Durable 2-meter USB-C cable for fast charging and data transfer.",
  price: 599.99,
  quantity: 50
)

Product.create!(
  name: "Phone Case",
  description: "Premium protective phone case with scratch-resistant coating.",
  price: 1299.99,
  quantity: 30
)

Product.create!(
  name: "Laptop Stand",
  description: "Adjustable aluminum laptop stand for ergonomic working.",
  price: 2499.99,
  quantity: 10
)

Product.create!(
  name: "Portable Power Bank",
  description: "20000mAh power bank with dual USB ports and fast charging support.",
  price: 2299.99,
  quantity: 25
)

puts "Created #{Product.count} products"
