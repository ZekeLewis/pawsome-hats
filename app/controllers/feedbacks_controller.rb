class FeedbacksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      flash[:notice] = 'Thank you for your valuable Feedback!'
      redirect_to feedbacks_url
    else
      flash.now[:error] = 'Please fill out all required fields.'
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @feedbacks = Feedback.all
  end

  def show
    @feedbacks = Feedback.all
    #render :json => @feedbacks
    render 'show'
end

  private

  def feedback_params
    params.require(:feedback).permit(:rating, :category, :details)
  end
end