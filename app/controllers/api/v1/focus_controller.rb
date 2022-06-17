class Api::V1::FocusController < ApplicationController

  def index

    @focus = Focu.all
    render json:@focus
  end

  def show
    render json: Focu.find(params[:id])
  end

end
