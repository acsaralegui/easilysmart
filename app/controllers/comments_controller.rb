class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @coach = Coach.find(params[:coach_id])
    @coach.comments.create(comment_params.merge(user: current_user))
    redirect_to coach_path(@coach)
  end

   private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end
end
