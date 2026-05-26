require "open-uri"
require "rqrcode"

puts "Cleaning database..."

Order.destroy_all
Product.destroy_all
Category.destroy_all
User.destroy_all

puts "Creating users..."

users = 3.times.map do |i|
  User.create!(
    email: "user#{i + 1}@example.com",
    password: "123456"
  )
end

puts "Creating categories..."

categories = {
  living_room: Category.create!(name: "Living Room"),
  bedroom:     Category.create!(name: "Bedroom"),
  kitchen:     Category.create!(name: "Kitchen"),
  office:      Category.create!(name: "Office"),
  lighting:    Category.create!(name: "Lighting"),
  decor:       Category.create!(name: "Decoration")
}

# ------------------------
# SAFE IMAGE METHOD (NO CRASH)
# ------------------------
# def fetch_image(keyword)
#   begin
#     URI.parse("https://picsum.photos/seed/#{keyword}/600/400").open
#   rescue
#     URI.parse("https://via.placeholder.com/600x400.png").open
#   end
# end
#
# ------------------------
# SHARED IMAGES
# ------------------------

SOFA_IMAGE =
  "https://images.pexels.com/photos/276583/pexels-photo-276583.jpeg?auto=compress&cs=tinysrgb&w=600"

BEDROOM_IMAGE =
  "https://images.pexels.com/photos/1648768/pexels-photo-1648768.jpeg?auto=compress&cs=tinysrgb&w=600"

KITCHEN_IMAGE =
  "https://images.pexels.com/photos/5824883/pexels-photo-5824883.jpeg?auto=compress&cs=tinysrgb&w=600"

OFFICE_IMAGE =
  "https://images.pexels.com/photos/4050315/pexels-photo-4050315.jpeg?auto=compress&cs=tinysrgb&w=600"

LIGHTING_IMAGE =
  "https://images.pexels.com/photos/112811/pexels-photo-112811.jpeg?auto=compress&cs=tinysrgb&w=600"

DECOR_IMAGE =
  "https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg?auto=compress&cs=tinysrgb&w=600"

# ------------------------
# PRODUCT IMAGES
# ------------------------

PRODUCT_IMAGES = {
  # LIVING ROOM
  "Scandinavian Sofa" => SOFA_IMAGE,
  "Modern Coffee Table" => SOFA_IMAGE,
  "Velvet Armchair" => SOFA_IMAGE,
  "Wood TV Stand" => SOFA_IMAGE,
  "Minimalist Bookshelf" => SOFA_IMAGE,
  "Glass Side Table" => SOFA_IMAGE,
  "Corner Sectional Sofa" => SOFA_IMAGE,
  "Recliner Chair" => SOFA_IMAGE,
  "Large Area Rug" => SOFA_IMAGE,
  "Wall Art Set" => SOFA_IMAGE,

  # BEDROOM
  "Queen Size Bed" => BEDROOM_IMAGE,
  "Memory Foam Mattress" => BEDROOM_IMAGE,
  "Bedside Table" => BEDROOM_IMAGE,
  "Wardrobe Closet" => BEDROOM_IMAGE,
  "Luxury Bedding Set" => BEDROOM_IMAGE,
  "Soft Pillow Set" => BEDROOM_IMAGE,
  "Full-Length Mirror" => BEDROOM_IMAGE,
  "Bedroom Bench" => BEDROOM_IMAGE,
  "Storage Bed Frame" => BEDROOM_IMAGE,
  "Night Lamp" => BEDROOM_IMAGE,

  # KITCHEN
  "Nonstick Frying Pan" => KITCHEN_IMAGE,
  "Knife Set" => KITCHEN_IMAGE,
  "Blender Machine" => KITCHEN_IMAGE,
  "Coffee Maker" => KITCHEN_IMAGE,
  "Toaster Oven" => KITCHEN_IMAGE,
  "Cooking Pot Set" => KITCHEN_IMAGE,
  "Cutting Board" => KITCHEN_IMAGE,
  "Dish Rack" => KITCHEN_IMAGE,
  "Microwave Oven" => KITCHEN_IMAGE,
  "Electric Kettle" => KITCHEN_IMAGE,

  # OFFICE
  "Office Desk" => OFFICE_IMAGE,
  "Ergonomic Chair" => OFFICE_IMAGE,
  "Desk Lamp" => OFFICE_IMAGE,
  "Laptop Stand" => OFFICE_IMAGE,
  "Office Bookshelf" => OFFICE_IMAGE,
  "Drawer Organizer" => OFFICE_IMAGE,
  "Monitor Stand" => OFFICE_IMAGE,
  "Whiteboard" => OFFICE_IMAGE,
  "Office Cabinet" => OFFICE_IMAGE,
  "Standing Desk" => OFFICE_IMAGE,

  # LIGHTING
  "Ceiling Light Fixture" => LIGHTING_IMAGE,
  "Floor Lamp" => LIGHTING_IMAGE,
  "Table Lamp" => LIGHTING_IMAGE,
  "LED Strip Lights" => LIGHTING_IMAGE,
  "Pendant Light" => LIGHTING_IMAGE,
  "Wall Sconce" => LIGHTING_IMAGE,
  "Smart Bulb" => LIGHTING_IMAGE,
  "Desk Light" => LIGHTING_IMAGE,
  "Outdoor Lantern" => LIGHTING_IMAGE,
  "Chandelier" => LIGHTING_IMAGE,

  # DECOR
  "Decorative Vase" => DECOR_IMAGE,
  "Wall Mirror" => DECOR_IMAGE,
  "Indoor Plant" => DECOR_IMAGE,
  "Photo Frame Set" => DECOR_IMAGE,
  "Candle Holder" => DECOR_IMAGE,
  "Wall Clock" => DECOR_IMAGE,
  "Decorative Sculpture" => DECOR_IMAGE,
  "Throw Blanket" => DECOR_IMAGE,
  "Decorative Tray" => DECOR_IMAGE,
  "Shelf Decor Set" => DECOR_IMAGE
}

# ------------------------
# FETCH IMAGE
# ------------------------

def fetch_image(name)
  image_url = PRODUCT_IMAGES[name]

  URI.open(image_url)
rescue
  URI.open("https://placehold.co/600x400")
end

# ------------------------
# CREATE PRODUCT
# ------------------------
def create_product(name:, description:, price:, category:, keyword:, user:)
  # file = fetch_image("#{keyword}-#{name.parameterize}")
  file = fetch_image(name)

  stock = rand(0..20)

  product = Product.new(
    name: name,
    description: description,
    price_cents: price * 100, # ✅ FIXED
    category: category,
    available: stock > 0,
    user: user,
    sku: "#{name.parameterize}-#{rand(1000..9999)}",
    stock_quantity: stock
  )

  product.photos.attach(
    io: file,
    filename: "#{name.parameterize}.jpg",
    content_type: "image/jpeg"
  )

  product.save!

  # ------------------------
  # QR CODE
  # ------------------------
  product.update(
    qr_code: "http://localhost:3000/products/#{product.id}"
  )
end

# ------------------------
# PRODUCT GENERATOR
# ------------------------
def generate_products(category:, base_names:, keyword:, users:)
  base_names.each do |name|
    create_product(
      name: name,
      description: "#{name} designed for modern homes. Perfect for #{category.name.downcase}, combining style, comfort, and durability.",
      price: rand(50..1200),
      category: category,
      keyword: keyword,
      user: users.sample
    )
  end
end

# ------------------------
# LIVING ROOM
# ------------------------
generate_products(
  category: categories[:living_room],
  keyword: "living-room",
  users: users,
  base_names: [
    "Scandinavian Sofa",
    "Modern Coffee Table",
    "Velvet Armchair",
    "Wood TV Stand",
    "Minimalist Bookshelf",
    "Glass Side Table",
    "Corner Sectional Sofa",
    "Recliner Chair",
    "Large Area Rug",
    "Wall Art Set"
  ]
)

# ------------------------
# BEDROOM
# ------------------------
generate_products(
  category: categories[:bedroom],
  keyword: "bedroom",
  users: users,
  base_names: [
    "Queen Size Bed",
    "Memory Foam Mattress",
    "Bedside Table",
    "Wardrobe Closet",
    "Luxury Bedding Set",
    "Soft Pillow Set",
    "Full-Length Mirror",
    "Bedroom Bench",
    "Storage Bed Frame",
    "Night Lamp"
  ]
)

# ------------------------
# KITCHEN
# ------------------------
generate_products(
  category: categories[:kitchen],
  keyword: "kitchen",
  users: users,
  base_names: [
    "Nonstick Frying Pan",
    "Knife Set",
    "Blender Machine",
    "Coffee Maker",
    "Toaster Oven",
    "Cooking Pot Set",
    "Cutting Board",
    "Dish Rack",
    "Microwave Oven",
    "Electric Kettle"
  ]
)

# ------------------------
# OFFICE
# ------------------------
generate_products(
  category: categories[:office],
  keyword: "office",
  users: users,
  base_names: [
    "Office Desk",
    "Ergonomic Chair",
    "Desk Lamp",
    "Laptop Stand",
    "Office Bookshelf",
    "Drawer Organizer",
    "Monitor Stand",
    "Whiteboard",
    "Office Cabinet",
    "Standing Desk"
  ]
)

# ------------------------
# LIGHTING
# ------------------------
generate_products(
  category: categories[:lighting],
  keyword: "lighting",
  users: users,
  base_names: [
    "Ceiling Light Fixture",
    "Floor Lamp",
    "Table Lamp",
    "LED Strip Lights",
    "Pendant Light",
    "Wall Sconce",
    "Smart Bulb",
    "Desk Light",
    "Outdoor Lantern",
    "Chandelier"
  ]
)

# ------------------------
# DECORATION
# ------------------------
generate_products(
  category: categories[:decor],
  keyword: "decor",
  users: users,
  base_names: [
    "Decorative Vase",
    "Wall Mirror",
    "Indoor Plant",
    "Photo Frame Set",
    "Candle Holder",
    "Wall Clock",
    "Decorative Sculpture",
    "Throw Blanket",
    "Decorative Tray",
    "Shelf Decor Set"
  ]
)

puts "Seeding done!"
