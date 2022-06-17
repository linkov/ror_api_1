class Api::V1::UsersController < Api::ApiController
  # before_filter :authenticate_user!, except: [:new, :create]
  before_action :authenticate_user!
  before_action :user_needed
  before_filter :skip_password_attribute, only: :update

  def me
    render json:current_user, serializer: Api::V1::UserMvpSerializer, :root => 'user'
  end


  def index

    if params[:email]
      @usr = User.find_by_uid(params[:email])
      render json:[@usr] and return
    end


    if params[:flexreview]
      @usrs = User.where(:flexreview => true)
      render json:@usrs and return
    end

    if params[:uid]
      @usr = User.find_by_uid(params[:uid])
      render json:@usr and return
    end

      if params[:current] && current_user && current_user.email
      @usr = User.find_by_email(current_user.email)
      if  @usr
        render json:  [@usr]

      else
        render json: @usr.errors
      end

    elsif params[:rating_type_id]

      rtype = RatingType.where(:id => params[:rating_type_id]).first

      any_question = Question.where(:rating_type_id =>params[:rating_type_id]).first

    if any_question

        any_question_slider = SliderType.where(:id =>any_question.slider_type_id).first

        if any_question_slider && any_question_slider.code == "variants"

          suggestionchoices  = SuggestionChoice.where(:question_id =>rtype.questions.collect(&:id),:suggestion_id => params[:suggestion_id]).where.not(:user_id => current_user.id)
          users = User.where(:id => suggestionchoices.collect(&:user_id))
          render json:users and return
        end

      end



      current_user_works = Work.where(:user => current_user)
      rates = Rating.where(:work_id => current_user_works.collect(&:id), :question_id =>rtype.questions.collect(&:id) )
      users = User.where(:id => rates.collect(&:author_id),:guest => false)
      render json:users
    else
      render json: []
    end



  end

  def show
    @usr = User.find(params[:id])

    if @usr
      render json:  @usr
    else

      render json: @usr.errors
    end

  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: @user.errors
    end
  end

  def update
    @user = User.where(:id => params[:id]).first
    if @user
      @user.update(user_params)
    else
      @user.update_attributes(user_params)
    end

    render json: @user
    # @user.update_attributes(user_params)
    # if @user.update(user_params)
    #   render json: @user
    # else
    #   render json: @user.errors
    # end

  end

  private

  def skip_password_attribute
    params.except!(:password, :password_validation)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit!
  end

end
