class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all.order('created_at')
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path, 
        notice: "The Category #{@category.name} has been updated successfully!"
    else
      render admin_categories_path, error: 'The Category was not updated.'
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, 
        notice: "The Category #{@category.name} has been created successfully!"
    else
      render admin_categories_path, error: 'The Category was not created.'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path, 
      notice: "The Category #{@category.name} has been deleted successfully!"
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end


end
