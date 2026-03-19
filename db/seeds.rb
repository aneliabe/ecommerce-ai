require "securerandom"

Question.destroy_all

puts "Creating categories..."

electronics = Category.find_or_create_by!(name: "Electronics")
clothing    = Category.find_or_create_by!(name: "Clothing")
school      = Category.find_or_create_by!(name: "School Supplies")
home        = Category.find_or_create_by!(name: "Home")
sports      = Category.find_or_create_by!(name: "Sports")

puts "Creating products..."

products = [

  # Electronics
  { name: "Wireless Mouse", category: electronics, price: 25, stock_quantity: 40, image: "https://source.unsplash.com/600x600/?mouse,computer" },
  { name: "Bluetooth Headphones", category: electronics, price: 90, stock_quantity: 30, image: "https://source.unsplash.com/600x600/?headphones" },
  { name: "Mechanical Keyboard", category: electronics, price: 120, stock_quantity: 20, image: "https://source.unsplash.com/600x600/?keyboard" },
  { name: "USB-C Charger", category: electronics, price: 20, stock_quantity: 50, image: "https://source.unsplash.com/600x600/?charger" },
  { name: "Laptop Stand", category: electronics, price: 35, stock_quantity: 25, image: "https://source.unsplash.com/600x600/?laptop,stand" },

  # Clothing
  { name: "Cotton T-Shirt", category: clothing, price: 18, stock_quantity: 80, image: "https://source.unsplash.com/600x600/?tshirt" },
  { name: "Denim Jacket", category: clothing, price: 65, stock_quantity: 35, image: "https://source.unsplash.com/600x600/?denim,jacket" },
  { name: "Summer Dress", category: clothing, price: 45, stock_quantity: 40, image: "https://source.unsplash.com/600x600/?dress" },
  { name: "Running Shorts", category: clothing, price: 22, stock_quantity: 60, image: "https://source.unsplash.com/600x600/?shorts,clothing" },
  { name: "Hoodie", category: clothing, price: 50, stock_quantity: 55, image: "https://source.unsplash.com/600x600/?hoodie" },

  # School Supplies
  { name: "Spiral Notebook", category: school, price: 5, stock_quantity: 200, image: "https://source.unsplash.com/600x600/?notebook" },
  { name: "Backpack", category: school, price: 40, stock_quantity: 70, image: "https://source.unsplash.com/600x600/?backpack" },
  { name: "Pen Set", category: school, price: 12, stock_quantity: 120, image: "https://source.unsplash.com/600x600/?pens" },
  { name: "Highlighters", category: school, price: 8, stock_quantity: 110, image: "https://source.unsplash.com/600x600/?highlighters" },
  { name: "Desk Organizer", category: school, price: 15, stock_quantity: 60, image: "https://source.unsplash.com/600x600/?desk,organizer" },

  # Home
  { name: "Ceramic Mug", category: home, price: 14, stock_quantity: 90, image: "https://source.unsplash.com/600x600/?mug" },
  { name: "Desk Lamp", category: home, price: 32, stock_quantity: 35, image: "https://source.unsplash.com/600x600/?desk,lamp" },
  { name: "Wall Clock", category: home, price: 28, stock_quantity: 40, image: "https://source.unsplash.com/600x600/?wall,clock" },
  { name: "Throw Pillow", category: home, price: 20, stock_quantity: 50, image: "https://source.unsplash.com/600x600/?pillow" },
  { name: "Plant Pot", category: home, price: 16, stock_quantity: 70, image: "https://source.unsplash.com/600x600/?plant,pot" },

  # Sports
  { name: "Yoga Mat", category: sports, price: 25, stock_quantity: 65, image: "https://source.unsplash.com/600x600/?yoga,mat" },
  { name: "Water Bottle", category: sports, price: 15, stock_quantity: 100, image: "https://source.unsplash.com/600x600/?water,bottle" },
  { name: "Resistance Bands", category: sports, price: 18, stock_quantity: 75, image: "https://source.unsplash.com/600x600/?fitness,bands" },
  { name: "Jump Rope", category: sports, price: 10, stock_quantity: 90, image: "https://source.unsplash.com/600x600/?jump,rope" },
  { name: "Gym Gloves", category: sports, price: 22, stock_quantity: 45, image: "https://source.unsplash.com/600x600/?gym,gloves" }

]

products.each do |p|
  Product.find_or_create_by!(name: p[:name]) do |product|
    product.description = "High quality #{p[:name]}"
    product.price = p[:price]
    product.sku = SecureRandom.hex(4)
    product.stock_quantity = p[:stock_quantity]
    product.category = p[:category]
    product.available = true
    product.user = User.first
  end
end

puts "Seed completed!"
