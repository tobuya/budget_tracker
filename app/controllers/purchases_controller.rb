class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def new
    @categories = current_user.categories
    @category = @categories.select { |i| i.id == params[:category_id].to_i }[0]
    @purchase = Purchase.new
  end

  def create
    @category = Category.find(params[:category_id])
    @purchase = @category.purchases.build(purchase_params)
    @purchase.user = current_user
    @purchase.category_id = @category.id

    if @purchase.save
      flash[:success] = 'A purchase was successfully created'
      redirect_to category_path(@category)
    else
      error = @purchase.errors.full_messages[0]
      flash[:error] = "#{error}. Please try again"
      redirect_to new_category_purchase_path(@category)
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    flash[:success] = 'A purchase was successfully deleted'
    redirect_back(fallback_location: authenticated_user_path)
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :amount, :category_id, category_ids: [])
  end
end
