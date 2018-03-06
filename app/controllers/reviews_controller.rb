class ReviewsController < ApplicationController

  before_filter :authorize
  def show
    @reviews = Review.find_all_by(params[:product_id])
  end
  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(product_params)
    @review.user = current_user
    @review.product_id = @product.id
    if @review.save
      redirect_to product_path(@product)
    else
      render :'products/show'
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    @product = Product.find params[:product_id]
    redirect_to product_path(@product)
  end

  private

  def product_params
    params.require(:review).permit(
      :description,
      :rating
      )
  end


end

