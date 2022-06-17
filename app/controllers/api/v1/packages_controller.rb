class Api::V1::PackagesController < Api::ApiController

  before_action :authenticate_user!

  def index

    packages = Package.where(:active => true)
    render json:packages
  end

  def show
    render json: Package.find(params[:id])
  end

end
