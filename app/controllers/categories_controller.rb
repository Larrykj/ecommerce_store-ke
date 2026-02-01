class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_category, only: [ :show, :edit, :update, :destroy ]

  def index
    @categories = Category.all
  end

  def show
    # Start with products in this category
    base_products = @category.products
    
    # Apply search and filtering within this category
    if params[:search].present? || params[:min_price].present? || params[:max_price].present? || params[:stock_status].present? || params[:sort].present?
      @products = base_products.search_by_text(params[:search])
                               .by_min_price(params[:min_price])
                               .by_max_price(params[:max_price])
                               .by_stock_status(params[:stock_status])
                               .sorted_by(params[:sort] || 'newest')
    else
      @products = base_products.sorted_by('newest')
    end
    
    # Get price stats for this category
    @price_stats = {
      min: base_products.minimum(:price)&.to_f || 0,
      max: base_products.maximum(:price)&.to_f || 0
    }
    
    # Count active filters
    @active_filters_count = count_category_filters
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: "Category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Category was successfully deleted."
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def count_category_filters
    count = 0
    count += 1 if params[:search].present?
    count += 1 if params[:min_price].present? || params[:max_price].present?
    count += 1 if params[:stock_status].present?
    count += 1 if params[:sort].present?
    count
  end
end
