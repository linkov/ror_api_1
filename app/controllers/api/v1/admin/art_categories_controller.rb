class Api::V1::Admin::ArtCategoriesController < Api::ApiController

  before_action :authenticate_user!


  def show
    render json: ArtCategory.find(params[:id]),serializer: Api::V1::ArtCategoryAdminSerializer, :root => 'art_category'
  end


  def index
    render json:ArtCategory.all,each_serializer: Api::V1::ArtCategoryAdminSerializer, :root => 'art_category'
  end

end
