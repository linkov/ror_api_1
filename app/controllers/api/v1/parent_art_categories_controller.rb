class Api::V1::ParentArtCategoriesController < Api::ApiController

  before_action :authenticate_user!


  def show
    render json: ParentArtCategory.find(params[:id])
  end


  def index
    render json:ParentArtCategory.all
  end

end
