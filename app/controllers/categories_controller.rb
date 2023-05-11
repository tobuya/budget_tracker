class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories.includes(:purchases)
    @unique_purchases = current_user.purchases.joins(:categories).distinct
    @total_purchases = @unique_purchases.map(&:amount).sum
  end

  def show
    @category = current_user.categories.includes(:purchases).find(params[:id])
    @purchases = @category.purchases.sort { |a, b| b.updated_at <=> a.updated_at }
    @total_amount = @purchases.map(&:amount).sum
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      flash[:success] = 'Category was successfully created'
      redirect_to categories_path
    else
      error = @category.errors.full_messages[0]
      flash[:error] = "#{error}. Please try again"
      redirect_to new_category_path
    end
  end

  def edit
    @category = current_user.categories.find(params[:id])
  end

  def update
    @category = current_user.categories.find(params[:id])
    return unless @category.update(category_params)

    flash[:success] = "#{@category.name} was successfully updated"
    redirect_to categories_path(@category)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    flash[:success] = "#{@category.name} was successfully deleted"
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
