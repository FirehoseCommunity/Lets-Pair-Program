class SectionsController < ApplicationController

  def new
    @section = Section.new
  end

  def create
    @section = Section.create(section_params)
    redirect_to root_path
  end

  def show
    @section = Section.find(params[:id])
  end

  private

  def section_params
    params.require(:section).permit(:name)
  end

end
