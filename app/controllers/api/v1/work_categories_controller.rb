class Api::V1::WorkCategoriesController < Api::ApiController

  def index

    @categories = WorkCategory.all
    render json:@categories
  end

  def show
    render json: WorkCategory.find(params[:id])
  end

end
