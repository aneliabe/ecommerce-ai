class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_neighbors :embedding

  after_create :set_embedding

  validates :name, presence: true
  validates :price, presence: true
  validates :sku, presence: true, uniqueness: true

  monetize :price_cents

  has_many_attached :photos

  before_validation :generate_sku

  private

  def generate_sku
    return if self.sku.present?

    loop do
      self.sku = SecureRandom.hex(8)   # ✅ THIS is the fix
      break unless Product.exists?(sku: self.sku)
    end
  end

  def set_embedding
    client = OpenAI::Client.new
    response = client.embeddings(
      parameters: {
        model: 'text-embedding-3-small',
        input: "Product: #{name}. Description: #{description} - Price: #{price}"
      }
    )
    embedding = response['data'][0]['embedding']
    update(embedding: embedding)
  end
end
