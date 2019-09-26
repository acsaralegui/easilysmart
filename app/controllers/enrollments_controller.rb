class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    if current_tutorial.premium?
      # Amount in cents
      @amount = (current_tutorial.cost * 100).to_i

      customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        source: params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        description: 'easilysmart Content',
        currency: 'usd'
      )
    end

  current_user.enrollments.create(tutorial: current_tutorial)
  redirect_to tutorial_path(current_tutorial) 
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

  private

  def current_tutorial
    @current_tutorial ||= Tutorial.find(params[:tutorial_id])
  end
end

