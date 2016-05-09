class SectionsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :confirm_admin, only: [:new,:create]

  def new
    @section = Section.new
  end

  def create
    @section = current_category.sections.create(section_params)
    if @section.valid?
      redirect_to categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def section_params
    params.require(:section).permit(:name, :description)
  end


  def current_category
    @current_category = Category.find(params[:category_id])
  end

end
