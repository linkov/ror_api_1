class Api::V1::Admin::ProficienciesController < Api::ApiController

  before_action :authenticate_user!

  def index

    models = Proficiency.all
    render json:models
  end

  def show
    render json: Proficiency.find(params[:id])
  end

end
