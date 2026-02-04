class WishlistItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = current_user.wishlist_products
  end

  def create
    @product = Product.find(params[:product_id])

    unless current_user.wishlist_products.include?(@product)
      current_user.wishlist_products << @product
      flash[:notice] = t("wishlist_added_success")
    else
      flash[:alert] = t("wishlist_already_exists")
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
      flash[:notice] = t("wishlist_removed_success")
    else
      flash[:alert] = t("wishlist_item_not_found")
    end

    redirect_back fallback_location: products_path
  end
end
# EOF
