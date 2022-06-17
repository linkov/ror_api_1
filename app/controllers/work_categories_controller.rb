class WorkCategoriesController < ApplicationController

def permitted_params
  params.permit!
end



def index

  # @works = Work.where.not(user: current_or_guest_user)
  @categories = WorkCategory.all
  render json:@categories
end

# GET /workcategories/1
# GET /workcategories/1.json
def show
  @work_category = WorkCategory.find(params[:id])
  render json:@work_category

end


  def ratetypes
    @work_category = WorkCategory.find(params[:id])
    @ratetypes = @work_category.rating_types
    render json:@ratetypes

  end


end
