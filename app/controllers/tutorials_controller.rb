class TutorialsController < ApplicationController
  def index
    @tutorial =Tutorial.all
  end

  def show
   @tutorial = Tutorial.find(params[:id])
  end
end

