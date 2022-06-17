class Api::V1::TutorialsController < Api::ApiController
  # before_action :authenticate_user!

  def index
    render json:Tutorial.all
  end

  def show
    render json:Tutorial.where(:id => params[:id])
  end


end
