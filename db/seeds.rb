require "open-uri"

puts "Cleaning database..."

Order.destroy_all
Product.destroy_all
Category.destroy_all

puts "Creating categories..."

categories = {
  living_room: Category.create!(name: "Living Room"),
  bedroom:     Category.create!(name: "Bedroom"),
  kitchen:     Category.create!(name: "Kitchen"),
  office:      Category.create!(name: "Office"),
  lighting:    Category.create!(name: "Lighting"),
  decor:       Category.create!(name: "Decoration")
}

def create_product(name:, description:, price:, category:, keyword:)
  begin
    file = URI.parse("https://source.unsplash.com/600x400/?#{keyword}").open("User-Agent" => "Ruby")
  rescue
    file = URI.parse("https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg").open
  end

  product = Product.new(
    name: name,
    description: description,
    price: price,
    category: category,
    available: true,
    user: User.first
  )

  product.photos.attach(
    io: file,
    filename: "#{name.parameterize}.jpg",
    content_type: "image/jpeg"
  )

  product.save!
end

# ------------------------
# PRODUCT GENERATOR
# ------------------------

def generate_products(category:, base_names:, keyword:)
  base_names.each do |name|
    create_product(
      name: name,
      description: "#{name} designed for modern homes. Ideal for #{category.name.downcase}, combining style, comfort, and functionality.",
      price: rand(50..1200),
      category: category,
      keyword: keyword
    )
  end
end

# ------------------------
# LIVING ROOM (10)
# ------------------------
generate_products(
  category: categories[:living_room],
  keyword: "living room furniture",
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
# BEDROOM (10)
# ------------------------
generate_products(
  category: categories[:bedroom],
  keyword: "bedroom furniture",
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
# KITCHEN (10)
# ------------------------
generate_products(
  category: categories[:kitchen],
  keyword: "kitchen tools",
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
# OFFICE (10)
# ------------------------
generate_products(
  category: categories[:office],
  keyword: "office furniture",
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
# LIGHTING (10)
# ------------------------
generate_products(
  category: categories[:lighting],
  keyword: "home lighting",
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
# DECORATION (10)
# ------------------------
generate_products(
  category: categories[:decor],
  keyword: "home decor",
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
