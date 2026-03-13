# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Product.destroy_all
User.destroy_all

puts "Creating user..."

user = User.create!(
  email: "test@test.com",
  password: "123456"
)

puts "Creating products..."

Product.create!(
  name: "Laptop",
  description: "Fast laptop",
  price: 1200,
  available: true,
  user: user
)

Product.create!(
  name: "Headphones",
  description: "Noise cancelling",
  price: 300,
  available: true,
  user: user
)

Product.create!(
  name: "Smartphone",
  description: "Latest model smartphone",
  price: 900,
  available: true,
  user: user
)

Product.create!(
  name: "Tablet",
  description: "10-inch display tablet",
  price: 600,
  available: true,
  user: user
)

Product.create!(
  name: "Monitor",
  description: "27-inch 4K monitor",
  price: 450,
  available: true,
  user: user
)

Product.create!(
  name: "Keyboard",
  description: "Mechanical keyboard",
  price: 120,
  available: true,
  user: user
)

Product.create!(
  name: "Mouse",
  description: "Wireless ergonomic mouse",
  price: 60,
  available: true,
  user: user
)

Product.create!(
  name: "Webcam",
  description: "HD webcam for video calls",
  price: 80,
  available: true,
  user: user
)

Product.create!(
  name: "Microphone",
  description: "USB condenser microphone",
  price: 150,
  available: true,
  user: user
)

Product.create!(
  name: "Gaming Chair",
  description: "Comfortable ergonomic chair",
  price: 350,
  available: true,
  user: user
)

Product.create!(
  name: "External SSD",
  description: "1TB portable SSD",
  price: 180,
  available: true,
  user: user
)

Product.create!(
  name: "USB Hub",
  description: "7-port USB hub",
  price: 40,
  available: true,
  user: user
)

Product.create!(
  name: "Printer",
  description: "All-in-one inkjet printer",
  price: 220,
  available: true,
  user: user
)

Product.create!(
  name: "Desk Lamp",
  description: "LED desk lamp with adjustable brightness",
  price: 45,
  available: true,
  user: user
)

Product.create!(
  name: "Router",
  description: "High-speed WiFi router",
  price: 130,
  available: true,
  user: user
)

Product.create!(
  name: "Smartwatch",
  description: "Fitness tracking smartwatch",
  price: 250,
  available: true,
  user: user
)

Product.create!(
  name: "Bluetooth Speaker",
  description: "Portable Bluetooth speaker",
  price: 90,
  available: true,
  user: user
)

Product.create!(
  name: "Power Bank",
  description: "20000mAh portable charger",
  price: 55,
  available: true,
  user: user
)

Product.create!(
  name: "VR Headset",
  description: "Virtual reality headset",
  price: 400,
  available: true,
  user: user
)

Product.create!(
  name: "Graphics Tablet",
  description: "Digital drawing tablet",
  price: 210,
  available: true,
  user: user
)

Product.create!(
  name: "Laptop Stand",
  description: "Adjustable aluminum laptop stand",
  price: 70,
  available: true,
  user: user
)

Product.create!(
  name: "Cable Organizer",
  description: "Desk cable management box",
  price: 25,
  available: true,
  user: user
)

Product.create!(
  name: "Cotton T-Shirt",
  description: "Comfortable white cotton t-shirt",
  price: 20,
  available: true,
  user: user
)

Product.create!(
  name: "Blue Jeans",
  description: "Classic blue denim jeans",
  price: 55,
  available: true,
  user: user
)

Product.create!(
  name: "Hoodie",
  description: "Warm fleece hoodie",
  price: 45,
  available: true,
  user: user
)

Product.create!(
  name: "Running Shoes",
  description: "Lightweight running sneakers",
  price: 80,
  available: true,
  user: user
)

Product.create!(
  name: "Baseball Cap",
  description: "Adjustable cotton cap",
  price: 18,
  available: true,
  user: user
)

Product.create!(
  name: "Backpack",
  description: "Durable school backpack",
  price: 40,
  available: true,
  user: user
)

Product.create!(
  name: "Notebook",
  description: "200-page lined notebook",
  price: 8,
  available: true,
  user: user
)

Product.create!(
  name: "Ballpoint Pens",
  description: "Pack of 10 blue pens",
  price: 6,
  available: true,
  user: user
)

Product.create!(
  name: "Highlighters",
  description: "Set of 5 colorful highlighters",
  price: 9,
  available: true,
  user: user
)

Product.create!(
  name: "Pencil Case",
  description: "Fabric pencil pouch",
  price: 12,
  available: true,
  user: user
)

Product.create!(
  name: "Desk Chair",
  description: "Comfortable office desk chair",
  price: 120,
  available: true,
  user: user
)

Product.create!(
  name: "Water Bottle",
  description: "Reusable stainless steel bottle",
  price: 22,
  available: true,
  user: user
)

Product.create!(
  name: "Coffee Mug",
  description: "Ceramic coffee mug",
  price: 14,
  available: true,
  user: user
)

Product.create!(
  name: "Blanket",
  description: "Soft fleece blanket",
  price: 35,
  available: true,
  user: user
)

Product.create!(
  name: "Pillow",
  description: "Memory foam pillow",
  price: 30,
  available: true,
  user: user
)

Product.create!(
  name: "Sunglasses",
  description: "UV protection sunglasses",
  price: 28,
  available: true,
  user: user
)

Product.create!(
  name: "Leather Belt",
  description: "Classic brown leather belt",
  price: 32,
  available: true,
  user: user
)

Product.create!(
  name: "Winter Jacket",
  description: "Warm insulated jacket",
  price: 120,
  available: true,
  user: user
)

Product.create!(
  name: "Sports Shorts",
  description: "Breathable athletic shorts",
  price: 25,
  available: true,
  user: user
)

Product.create!(
  name: "Yoga Mat",
  description: "Non-slip exercise yoga mat",
  price: 35,
  available: true,
  user: user
)

Product.create!(
  name: "Lunch Box",
  description: "Insulated lunch container",
  price: 18,
  available: true,
  user: user
)

Product.create!(
  name: "Sticky Notes",
  description: "Pack of colorful sticky notes",
  price: 7,
  available: true,
  user: user
)

Product.create!(
  name: "Stapler",
  description: "Standard office stapler",
  price: 10,
  available: true,
  user: user
)

Product.create!(
  name: "Scissors",
  description: "Sharp stainless steel scissors",
  price: 9,
  available: true,
  user: user
)

Product.create!(
  name: "Desk Organizer",
  description: "Organizer for pens and office supplies",
  price: 16,
  available: true,
  user: user
)

Product.create!(
  name: "Wall Clock",
  description: "Minimalist wall clock",
  price: 27,
  available: true,
  user: user
)

Product.create!(
  name: "Photo Frame",
  description: "Wooden photo frame",
  price: 15,
  available: true,
  user: user
)

Product.create!(
  name: "Reusable Shopping Bag",
  description: "Eco-friendly cloth shopping bag",
  price: 12,
  available: true,
  user: user
)

Product.create!(
  name: "Kitchen Knife",
  description: "Stainless steel chef knife",
  price: 38,
  available: true,
  user: user
)

Product.create!(
  name: "Cutting Board",
  description: "Wooden kitchen cutting board",
  price: 24,
  available: true,
  user: user
)

puts "Finished!"
