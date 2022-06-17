class Api::V1::TutorialStepsController < Api::ApiController
  # before_action :authenticate_user!

  def index


    if params[:tutorial]
      render json:TutorialStep.where(:tutorial_id =>  params[:tutorial])
    else
      render json:TutorialStep.all
    end


  end

  def show
    render json:TutorialStep.where(:id => params[:id])
  end


end
