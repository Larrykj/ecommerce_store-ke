# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
Review.destroy_all
Product.destroy_all
Category.destroy_all
User.where.not(email: "admin@example.com").destroy_all

# Create sample users for reviews
puts "Creating sample users..."
users = []
user_data = [
  { name: "John Kamau", email: "john@example.com", password: "password123" },
  { name: "Mary Wanjiku", email: "mary@example.com", password: "password123" },
  { name: "David Ochieng", email: "david@example.com", password: "password123" },
  { name: "Grace Muthoni", email: "grace@example.com", password: "password123" },
  { name: "Peter Njoroge", email: "peter@example.com", password: "password123" }
]

user_data.each do |data|
  users << User.find_or_create_by!(email: data[:email]) do |user|
    user.name = data[:name]
    user.password = data[:password]
  end
end

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

# Create Sample Reviews
puts "Creating sample reviews..."

review_templates = [
  { rating: 5, title: "Excellent product!", content: "I absolutely love this product! The quality exceeded my expectations. Would definitely recommend to everyone." },
  { rating: 5, title: "Best purchase ever", content: "Amazing quality and fast delivery. This is exactly what I was looking for. Very satisfied with my purchase." },
  { rating: 4, title: "Great value for money", content: "Good product overall. The quality is decent for the price. Would buy again if needed." },
  { rating: 4, title: "Very satisfied", content: "Nice product, works as described. Happy with the quality and delivery was quick to Nairobi." },
  { rating: 3, title: "It's okay", content: "The product is average. Does what it's supposed to do but nothing special. Fair price though." },
  { rating: 5, title: "Highly recommended", content: "Outstanding quality! This product has become my favorite. The craftsmanship is superb and very authentic." },
  { rating: 4, title: "Good quality", content: "Solid product with good build quality. Minor improvements could be made but overall very happy." },
  { rating: 5, title: "Perfect!", content: "Everything about this product is perfect. From the packaging to the quality, it's all top-notch. Love it!" },
  { rating: 3, title: "Decent purchase", content: "It's an okay product. Not bad but not exceptional either. Gets the job done for the price." },
  { rating: 4, title: "Worth buying", content: "Very pleased with this purchase. Good quality and exactly as described. Fast shipping too!" }
]

# Add reviews to random products
products = Product.all.to_a
products.each do |product|
  # Add 1-4 reviews per product
  num_reviews = rand(1..4)
  reviewers = users.sample(num_reviews)
  
  reviewers.each do |user|
    template = review_templates.sample
    Review.create!(
      user: user,
      product: product,
      rating: template[:rating],
      title: template[:title],
      content: template[:content],
      helpful_count: rand(0..15)
    )
  end
end

puts "Created #{Category.count} categories, #{Product.count} products, #{User.count} users, and #{Review.count} reviews"

