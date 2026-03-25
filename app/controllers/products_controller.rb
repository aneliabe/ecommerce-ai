class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    if params.dig(:search, :query).present?
      query = params[:search][:query]

      exact = Product.where("LOWER(name) = ?", query.downcase)
      partial = Product.where("name ILIKE ?", "%#{query}%")
      @products = exact.exists? ? exact : partial
    else
      @products = Product.all.sample(8)
    end
  end

  def show
    @product = Product.find(params[:id])
    @qr_code = RQRCode::QRCode.new(@product.qr_code)
    @svg = @qr_code.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      standalone: true,
      module_size: 5
    )
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
    if @product.orders.exists?
      redirect_to @product, alert: "Cannot delete a product with existing orders."
    else
      @product.destroy
      redirect_to products_path, notice: "Product deleted."
    end
  end

  def my_products
    @products = current_user.products
  end


  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock_quantity, :category_id, :qr_code, photos: [])
  end
end
