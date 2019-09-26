class Coach::ChaptersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_section


  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = @current_section.chapters.create(chapter_params)
    redirect_to coach_tutorial_path(current_section.tutorial)
  end

  private

  def require_authorized_for_current_section
    if current_section.tutorial.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end


  helper_method :current_section
  def current_section
    @current_section ||= Section.find(params[:section_id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :subtitle, :video)
  end
end
