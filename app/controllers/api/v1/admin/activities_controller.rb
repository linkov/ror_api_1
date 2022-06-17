class Api::V1::Admin::ActivitiesController < Api::ApiController
  before_filter :authenticate_user!, only: :yours

  def index
    activities = PublicActivity::Activity.order("created_at DESC").all
    render json:activities
  end

  def yours
    @activities = PublicActivity::Activity.order("created_at DESC").where(owner_type: "User", owner_id: current_user).all

    respond_to do |format|
      format.html
    end
  end

  def show
    @activity = PublicActivity::Activity.find(params[:id])

    respond_to do |format|
      format.html
    end
  end


end
