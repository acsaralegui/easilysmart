class Coach::TutorialsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_tutorial, only: [:show]

  def new
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = current_user.tutorials.create(tutorial_params)
    if @tutorial.valid?
      redirect_to coach_tutorial_path(@tutorial)
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    
  end

  private

  def require_authorized_for_current_tutorial
    if current_tutorial.user != current_user
      render plain: "Unauthorized", status: :unauthorized
    end
  end

  helper_method :current_tutorial
  def current_tutorial
    @current_tutorial ||= Tutorial.find(params[:id])
  end

  def tutorial_params
    params.require(:tutorial).permit(:title, :System_type, :description, :cost, :image)
  end
end
