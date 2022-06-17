class Api::V1::Admin::TutorialTypesController < Api::ApiController

  before_action :authenticate_user!

  def index

    models = TutorialType.all
    render json:models
  end

  def show
    render json: TutorialType.find(params[:id])
  end

end
