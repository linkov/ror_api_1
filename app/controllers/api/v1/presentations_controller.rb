class Api::V1::PresentationsController < ApplicationController

  def index
    render json: Presentation.all
  end

  def show
    render json: Presentation.find(params[:id])
  end

end
