class QuestionsController < ApplicationController

  def show
    render json: Question.find(params[:id])
  end
end
