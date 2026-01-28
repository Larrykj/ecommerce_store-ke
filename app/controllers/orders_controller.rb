class OrdersController < ApplicationController
  def new
    if @cart.cart_items.empty?
      redirect_to cart_path, alert: "Your cart is empty"
    else
      @order = Order.new
    end
  end

  def create
    @order = Order.new(order_params)
    @order.total_price = @cart.total_price

    if @order.save
      # Move items from cart to order
      @cart.cart_items.each do |cart_item|
        @order.order_items.create!(
          product: cart_item.product,
          quantity: cart_item.quantity,
          price: cart_item.product.price
        )
        
        # Reduce stock
        new_quantity = cart_item.product.quantity - cart_item.quantity
        cart_item.product.update(quantity: new_quantity)
      end
      
      # Empty the cart
      @cart.cart_items.destroy_all
      
      redirect_to @order, notice: "Thank you for your order!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address)
  end
end
