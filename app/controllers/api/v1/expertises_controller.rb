class Api::V1::ExpertisesController < Api::ApiController

  before_action :authenticate_user!

  def index

    objects = Expertise.all
    render json:objects
  end

  def show
    render json: Expertise.find(params[:id])
  end

end
