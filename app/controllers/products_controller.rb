class ProductsController < ApplicationController
  before_action :set_product, only: [ :show, :edit, :update, :destroy ]

  # GET /products
  def index
    # Get all categories for the filter dropdown
    @categories = Category.all

    # Get price range for the dynamic price filter UI
    @price_stats = Product.price_stats

    # Apply advanced search and filtering
    @products = Product.advanced_search(search_params)

    # Calculate active filters count for UI feedback
    @active_filters_count = count_active_filters

    # Store the current search parameters for the view
    @search_params = search_params
  end

  # GET /products/:id
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /products/:id/edit
  def edit
  end

  # PATCH/PUT /products/:id
  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /products/:id
  def destroy
    @product.destroy
    redirect_to products_url, notice: "Product was successfully deleted."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
      params.require(:product).permit(:name, :description, :price, :quantity, :image, :category_id)
  end

  # Permitted parameters for search and filtering
  def search_params
    params.permit(:search, :category_id, :min_price, :max_price, :stock_status, :sort).to_h.symbolize_keys
  end

  # Count how many filters are currently active
  def count_active_filters
    count = 0
    count += 1 if params[:search].present?
    count += 1 if params[:category_id].present?
    count += 1 if params[:min_price].present? || params[:max_price].present?
    count += 1 if params[:stock_status].present?
    count += 1 if params[:sort].present?
    count
  end
end
