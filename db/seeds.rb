# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
# Clear existing data
Product.destroy_all
Category.destroy_all

# Create Categories
electronics = Category.create!(name: "Electronics", description: "Gadgets and devices for the modern Kenyan techie.")
fashion = Category.create!(name: "Fashion", description: "Trendy outfits and accessories for the African style.")
home_decor = Category.create!(name: "Home & Living", description: "Authentic decor to brighten up your home.")
groceries = Category.create!(name: "Groceries", description: "Fresh produce and pantry staples from local farmers.")
beauty = Category.create!(name: "Beauty & Personal Care", description: "Skin care and beauty products for the African glow.")

# Create Products

# Electronics
Product.create!(
  name: "Wireless Headphones",
  description: "High-quality wireless headphones with noise cancellation and 30-hour battery life. Perfect for Nairobi commutes.",
  price: 4999.00,
  quantity: 15,
  category: electronics
)
Product.create!(
  name: "USB-C Cable",
  description: "Durable 2-meter USB-C cable for fast charging and data transfer.",
  price: 599.00,
  quantity: 50,
  category: electronics
)
Product.create!(
  name: "Portable Power Bank",
  description: "20000mAh power bank to keep you connected during blackouts.",
  price: 2299.00,
  quantity: 25,
  category: electronics
)
Product.create!(
  name: "Smart Watch Series 5",
  description: "Track your fitness and notifications on the go across Kenya.",
  price: 8500.00,
  quantity: 10,
  category: electronics
)
Product.create!(
  name: "Bluetooth Speaker",
  description: "Portable speaker with deep bass for your road trips.",
  price: 3500.00,
  quantity: 20,
  category: electronics
)

# Fashion
Product.create!(
  name: "Kitenge Bomber Jacket",
  description: "Stylish bomber jacket featuring authentic Kitenge prints.",
  price: 3500.00,
  quantity: 12,
  category: fashion
)
Product.create!(
  name: "Maasai Beaded Sandals",
  description: "Handcrafted leather sandals adorned with colorful Maasai beads.",
  price: 1500.00,
  quantity: 30,
  category: fashion
)
Product.create!(
  name: "Ankara Tote Bag",
  description: "Spacious tote bag made from vibrant Ankara fabric.",
  price: 1200.00,
  quantity: 18,
  category: fashion
)
Product.create!(
  name: "Denim Jacket",
  description: "Classic denim jacket for cool Nairobi evenings.",
  price: 2800.00,
  quantity: 15,
  category: fashion
)
Product.create!(
  name: "Khaki Trousers",
  description: "Comfortable khaki trousers suitable for office or casual wear.",
  price: 2200.00,
  quantity: 25,
  category: fashion
)

# Home & Living
Product.create!(
  name: "Handwoven Sisal Basket",
  description: "Beautifully woven basket from Machakos, perfect for storage or decor.",
  price: 1800.00,
  quantity: 20,
  category: home_decor
)
Product.create!(
  name: "Soapstone Carving",
  description: "Intricate soapstone sculpture handcrafted in Kisii.",
  price: 1200.00,
  quantity: 10,
  category: home_decor
)
Product.create!(
  name: "Kikoy Throw Blanket",
  description: "Soft and colorful Kikoy throw to add warmth to your living room.",
  price: 2500.00,
  quantity: 15,
  category: home_decor
)
Product.create!(
  name: "Wooden Serving Spoon Set",
  description: "Hand-carved wooden spoons made from sustainable olive wood.",
  price: 900.00,
  quantity: 25,
  category: home_decor
)
Product.create!(
  name: "Safari Themed Cushion Covers",
  description: "Set of 4 cushion covers featuring African wildlife prints.",
  price: 2000.00,
  quantity: 12,
  category: home_decor
)

# Groceries
Product.create!(
  name: "Premium Kenyan Coffee",
  description: "Rich and aromatic AA ground coffee from the highlands.",
  price: 850.00,
  quantity: 40,
  category: groceries
)
Product.create!(
  name: "Macadamia Nuts",
  description: "Crunchy and salted macadamia nuts, a perfect healthy snack.",
  price: 1100.00,
  quantity: 30,
  category: groceries
)
Product.create!(
  name: "Raw Honey",
  description: "Pure, organic honey harvested from local beehives.",
  price: 950.00,
  quantity: 20,
  category: groceries
)
Product.create!(
  name: "Spicy Pilau Masala",
  description: "Authentic spice blend for making delicious Pilau rice.",
  price: 250.00,
  quantity: 60,
  category: groceries
)
Product.create!(
  name: "Hibiscus Tea Leaves",
  description: "Dried hibiscus flowers for a refreshing and healthy tea.",
  price: 400.00,
  quantity: 35,
  category: groceries
)

# Beauty
Product.create!(
  name: "Shea Butter Cream",
  description: "Moisturizing unrefined shea butter for hair and skin.",
  price: 600.00,
  quantity: 25,
  category: beauty
)
Product.create!(
  name: "African Black Soap",
  description: "Natural soap for cleansing and exfoliating skin.",
  price: 350.00,
  quantity: 40,
  category: beauty
)
Product.create!(
  name: "Coconut Oil",
  description: "Cold-pressed coconut oil for deep conditioning.",
  price: 550.00,
  quantity: 30,
  category: beauty
)
Product.create!(
  name: "Aloe Vera Gel",
  description: "Soothing aloe vera gel for sunburns and hydration.",
  price: 450.00,
  quantity: 20,
  category: beauty
)
Product.create!(
  name: "Beard Oil",
  description: "Nourishing oil blend for grooming and maintaining beards.",
  price: 800.00,
  quantity: 15,
  category: beauty
)

puts "Created #{Category.count} categories and #{Product.count} products"
