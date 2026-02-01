class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :set_review, only: [:edit, :update, :destroy, :helpful]
  before_action :authorize_review, only: [:edit, :update, :destroy]

  def create
    @review = @product.reviews.build(review_params)
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to @product, notice: "Your review has been submitted successfully!" }
        format.turbo_stream { flash.now[:notice] = "Your review has been submitted successfully!" }
      else
        format.html { redirect_to @product, alert: @review.errors.full_messages.join(", ") }
        format.turbo_stream { flash.now[:alert] = @review.errors.full_messages.join(", ") }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @product, notice: "Your review has been updated successfully!" }
        format.turbo_stream { flash.now[:notice] = "Your review has been updated successfully!" }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { flash.now[:alert] = @review.errors.full_messages.join(", ") }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to @product, notice: "Your review has been deleted." }
      format.turbo_stream { flash.now[:notice] = "Your review has been deleted." }
    end
  end

  # Mark review as helpful
  def helpful
    @review.mark_helpful!
    respond_to do |format|
      format.html { redirect_to @product, notice: "Thanks for your feedback!" }
      format.turbo_stream
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_review
    @review = @product.reviews.find(params[:id])
  end

  def authorize_review
    unless @review.editable_by?(current_user)
      redirect_to @product, alert: "You are not authorized to perform this action."
    end
  end

  def review_params
    params.require(:review).permit(:rating, :title, :content)
  end
end
