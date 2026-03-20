class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @query = params[:query]

    if params[:search] && params[:search][:query].present?
      client = OpenAI::Client.new

      response = client.embeddings(
        parameters: {
          model: "text-embedding-3-small",
          input: params[:search][:query]
        }
      )

      query_embedding = response["data"][0]["embedding"]

      @products = Product.where.not(embedding: nil)
                        .nearest_neighbors(:embedding, query_embedding, distance: "cosine")
                        .first(8)
    else
      @products = Product.all.sample(8)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :available, :category_id, photos: [])
  end
end
