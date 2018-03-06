class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
    @reviews = Review.order(created_at: :desc).where product_id: @product.id
    puts 'hello'
    puts :id
  end

  def ratings_for_select
    return [1 ,2 ,3 ,4 , 5]
  end

end
