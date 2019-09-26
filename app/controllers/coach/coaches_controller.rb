class Coach::CoachesController < ApplicationController
  before_action :authenticate_user!

  def new
    @coach = Coach.new
  end

  def create
    @coach = current_user.coaches.create(coach_params)
    if @coach.valid?
      redirect_to coach_coach_path(@coach)
    else
      render :new, status: :unprocessble_entity
    end
  end

  def show
    @coach = Coach.find(params[:id])
  end

  private

  def coach_params
    params.require(:coach).permit(:name, :bio, :System_type, :description, :cost)
  end
    
end
