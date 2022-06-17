class Api::V1::WebnotificationsController < Api::ApiController

  def index

    @models = Webnotification.all
    render json:@models

  end

  def show
    render json: Webnotification.find(params[:id])
  end

end
