class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [ :update, :destroy ]

  # POST /cart_items
  def create
    product = Product.find(params[:product_id])
    @cart_item = @cart.cart_items.find_by(product: product)

    if @cart_item
      # If product already in cart, increase quantity
      @cart_item.quantity += 1
      @cart_item.save
      redirect_to cart_path, notice: "Product quantity updated in cart."
    else
      # Add new product to cart
      @cart_item = @cart.cart_items.create(product: product, quantity: 1)
      redirect_to cart_path, notice: "Product added to cart successfully."
    end
  end

  # PATCH/PUT /cart_items/:id
  def update
    if @cart_item.update(quantity: params[:quantity])
      redirect_to cart_path, notice: "Quantity updated."
    else
      redirect_to cart_path, alert: "Could not update quantity."
    end
  end

  # DELETE /cart_items/:id
  def destroy
    @cart_item.destroy
    redirect_to cart_path, notice: "Product removed from cart."
  end

  private

  def set_cart_item
    @cart_item = @cart.cart_items.find(params[:id])
  end
end
