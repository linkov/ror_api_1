class Api::V1::Admin::PackagesController < Api::ApiController

  before_action :authenticate_user!

  def index

    packages = Package.all
    render json:packages
  end

  def show
    render json: Package.find(params[:id])
  end

end
