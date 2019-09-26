class Coach::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_tutorial

  def new
    @section = Section.new
  end

  def create
    @section = @current_tutorial.sections.create(section_params)
    redirect_to coach_tutorial_path(current_tutorial)
  end

  private

  def require_authorized_for_current_tutorial
    if current_tutorial.user != current_user
      render plain: "Unauthorized", status: :unauthorized
    end
  end

  helper_method :current_tutorial
  def current_tutorial
    @current_tutorial ||= Tutorial.find(params[:tutorial_id])
  end

  def section_params
    params.require(:section).permit(:title)
  end
end
