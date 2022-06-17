class Api::V1::SliderTypesController < Api::ApiController

  before_action :authenticate_user!

  def index

    objects = SliderType.all
    render json:objects
  end

  def show
    render json: SliderType.find(params[:id])
  end

end
