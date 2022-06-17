class FocusController < ApplicationController

  def permitted_params
    params.permit!
  end
end
