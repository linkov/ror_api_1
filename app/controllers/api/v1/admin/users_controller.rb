class Api::V1::Admin::UsersController < Api::ApiController

  before_action :authenticate_user!

  def me
    render json:current_user, serializer: Api::V1::UserSerializer, :root => 'user'
  end

  def index
    render json:User.all
  end

  def show
    @usr = User.find(params[:id])

    if @usr
      render json:  @usr, serializer: Api::V1::UserSerializer, :root => 'user'
    else

      render json: @usr.errors
    end

  end

end
