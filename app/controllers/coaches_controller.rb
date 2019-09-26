class CoachesController < ApplicationController
  def index
    @coach = Coach.all
  end

  def show
    @coach = Coach.find(params[:id])
    @comment = Comment.new
  end
end
