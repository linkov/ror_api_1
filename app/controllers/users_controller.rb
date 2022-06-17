class UsersController < ApplicationController
  before_action :authorize_with_guest
  skip_before_filter :verify_authenticity_token, :only => [:ratecount]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :skip_password_attribute, only: :update
  respond_to :html, :js

  def index
    @users = User.all
  end


  def settings
    @user = User.find(params[:id])
  end

  def managecontent

    @user = User.find(params[:id])

    if current_user != @user
      render :nothing => true, :notice => 'Work doest not belong to you, dude'
    end

    @works = @user.works.paginate(page: params[:page])
    render json:@works

  end



  def ratecount

    @user = User.find(params[:id])
    @allratings =  Rating.where(author: @user);
    @rated_works =  @allratings.collect(&:work_id).uniq

    if  @rated_works and current_user.blank? and  (@rated_works.count == 2 or  @rated_works.count == 5 or  @rated_works.count == 9)
      @alert_message = "You rated "+ @rated_works.count.to_s + " works, congrats"
    end


    respond_to do |format|
     format.json { render :json => {:count => @rated_works.count, :alert_message => @alert_message} }
      end

  end

  def statistics

    @user = User.find(params[:id])

    if current_user != @user
      render :nothing => true, :notice => 'Work doest not belong to you, dude'
    end




    @allworks = @user.works.all
    @overallRatingTypes = RatingType.where("name like ?","%Overall%")
    @allratings = Rating.where(work: @allworks,rating_type_id: @overallRatingTypes.collect(&:id))
    @score = @allratings.collect(&:score).sum.to_f/@allratings.length if @allratings.length > 0


    if !@score or @allworks.count == 0
      @score = 0
    end
    @score = @score.round


    @works = @user.works.all
    @allallratings =  Rating.where(work: @allworks)
    @allallratingscategories = RatingType.where(id:@allallratings.collect(&:rating_type_id))
    @allallratingids = @allallratings.collect(&:id)


  end


  def show

    if current_user != @user
      render :nothing => true, :notice => 'Work doest not belong to you, dude'
    end

    @user = User.find(params[:id])
    # @works = user.works.paginate(page: params[:page])

    # respond_to do |format|
    #   format.html do
    #     @works
    #   end
    #   format.json do
    #     render json: @works
    #   end
    #
    # end

    render json: @user

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    if current_user != @user
      render :nothing => true, :notice => 'Work doest not belong to you, dude'
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

     @user.update_attributes(user_params)

    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to settings_path(@user), notice: 'User was successfully created.' }
    #     format.json { render :update, status: :created, location: settings_path(@user) }
    #   else
    #     format.html { render :settings,notice: @user.errors }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end

    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @user }
    #   else
    #     format.html { render :settings,notice: @user.errors}
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
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
      params.require(:user).permit(:name, :surname, :picture, :email, :password,:city, :zip, :country, :about, :temp_uid, :default_confirm_success_url)
    end
end
