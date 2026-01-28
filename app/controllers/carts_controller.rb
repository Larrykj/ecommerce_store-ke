class CartsController < ApplicationController
  def show
    @cart_items = @cart.cart_items.includes(:product)
  end
end
