class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_neighbors :embedding

  after_create :set_embedding

  validates :name, presence: true
  validates :price, presence: true
  validates :sku, uniqueness: true

  monetize :price_cents

  private

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
