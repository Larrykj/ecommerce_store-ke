class WishlistItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = current_user.wishlist_products
  end

  def create
    @product = Product.find(params[:product_id])
    unless current_user.wishlist_products.include?(@product)
      current_user.wishlist_products << @product
      flash[:notice] = "Product added to wishlist!"
    else
      flash[:alert] = "Product is already in your wishlist."
    end

    redirect_back fallback_location: products_path
  end

  def destroy
    # Can be destroyed by ID (if passed directly) or product_id lookup
    if params[:id]
      @item = current_user.wishlist_items.find_by(id: params[:id])
    elsif params[:product_id]
      @item = current_user.wishlist_items.find_by(product_id: params[:product_id])
    end

    if @item
      @item.destroy
      flash[:notice] = "Product removed from wishlist."
    else
      flash[:alert] = "Product not found in wishlist."
    end

    redirect_back fallback_location: products_path
  end
end
