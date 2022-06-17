class RatingTypesController < ApplicationController

  # def rating_type_params
  #   params.require(:rating_type).permit(:name, :focu)
  # end

  def permitted_params
    params.permit!
  end
end
