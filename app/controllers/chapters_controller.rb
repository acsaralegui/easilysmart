class ChaptersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_chapter, only:[:show]


  def show
  end

  private

  def require_authorized_for_current_chapter
    unless current_user.enrolled_in?(current_chapter.section.tutorial)
      redirect_to tutorial_url(current_chapter.section.tutorial), alert: "You must enroll in the course to view this Chapter"
    end
  end

  helper_method :current_chapter
  def current_chapter
    @current_chapter ||= Chapter.find(params[:id])
  end
end
