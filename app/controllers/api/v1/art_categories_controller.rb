class Api::V1::ArtCategoriesController < Api::ApiController

  before_action :authenticate_user!


  def show
    render json: ArtCategory.find(params[:id])
  end


  def index
    render json:ArtCategory.all
  end

end
