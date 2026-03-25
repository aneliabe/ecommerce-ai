class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @categories = Category.all

    if params[:category_id].present?
      @selected_category = Category.find(params[:category_id])
      @products = Product
                    .includes(:category)
                    .where(category_id: params[:category_id])
    else
      @products = Product
                    .includes(:category)
                    .sample(9)
    end
  end
end
