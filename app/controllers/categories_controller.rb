class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :confirm_admin, only: [:new,:create]


  def new
    @category = Category.new
  end

  def index
    @category = Category.all
    @section = Section.new
  end

  def show
    @category = Category.find(params[:id])
    @section = Section.new
  end


  def create
    @category = Category.create(category_params)

    if @category.valid?
      redirect_to categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end


  helper_method :current_category
    def current_category
        @current_category ||= Category.find(params[:id])
    end
end
