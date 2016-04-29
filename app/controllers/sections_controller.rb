class SectionsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :confirm_admin, only: [:new,:create]

  def new
    @section = Section.new
  end

  def create
    @section = current_category.sections.create(section_params)
    # @category_target = '#'+"category#{current_category.id}"
    # # To re-enable these commented options remember to go update the sections_controller_spec
    if @section.valid?
      # redirect_to proc {"#{categories_path}#{@category_target}"}
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
