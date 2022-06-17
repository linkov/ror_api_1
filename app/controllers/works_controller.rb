class WorksController < ApplicationController
  #before_action :authorize, only: [:show, :edit, :update, :destroy]
   before_action :authorize_with_guest
   skip_before_filter :verify_authenticity_token, :only => [:nextwork,:ratetypes,:rate,:hidework]
   impressionist :actions=>[:show,:index]

  # GET /works
  # GET /works.json
  def index

    # @works = Work.where.not(user: current_or_guest_user)
    @works = Work.where(id:10)
    # render json:@works
  end


   def hidework
     @work = Work.find(params[:id])
     @work.is_visible = false
     @work.save!
   end


   def nextwork

     @current_user_ratings = Rating.where(:author => current_or_guest_user)

     # if !current_user && @current_user_ratings.count > 20
     #
     #   render json:{'location':'/users/sign_in'}
     # else

     @works = Work.where.not(user: current_or_guest_user)
     # @ratings_of_current_user_works =
     @works_not_rated_by_this_user = @works.where.not(:id => @current_user_ratings.collect(&:work_id))
     @works = @works_not_rated_by_this_user

     offset = rand(@works.count)
     @nextwork =  @works.offset(offset).first


     @nextwork = Work.where(id:10).first
     render json:@nextwork


       # end

   end


   def nextquestion

     work = Work.find(params[:id])

     # rate_types for this work category and this work focus
     ratetypes = work.work_category.rating_types
     ratetypes = ratetypes.where(focu:work.focu)


     ratelevel = RateLevel.where(value:2).first

     # first level 1 question for any of rate types with work focus
     @question = Question.where(rate_level:ratelevel,rating_type:ratetypes).first

     render json:@question


   end

   def ratetype

     work = Work.find(params[:id])
     rate_types = work.work_category.rating_types

     offset = rand(rate_types.count)
     random_rate_type =  rate_types.offset(offset).first

     render json:[random_rate_type]

   end

   def ratetypes
     @work = Work.find(params[:id])
     @ratetypes = @work.rating_types

     @active_work = Work.where(:is_active => true, :user => current_user).first

     if @active_work

       @current_user_active_work_rating_types = @active_work.rating_types
       @rating_types_all =  @work.rating_types
       @rating_types_overall = @rating_types_all.where("name like ?","%Overall%")
       @rating_types = @rating_types_all.where(:id => @current_user_active_work_rating_types.collect(&:id)).where.not("name like ?","%Overall%")

       @combined_rating_types = @rating_types + @rating_types_overall

       render json:@combined_rating_types

     else

       @rating_types_all =  @work.rating_types
       render json:@rating_types_all

     end

     # render json:@ratetypes

   end



  # GET /works/1
  # GET /works/1.json
  def show

  end

  # GET /works/new
  def new
    @work = Work.new

  end



  # GET /works/1/edit
  def edit
    @work = Work.find(params[:id])

    if current_user != @work.user
      render :nothing => true, :notice => 'Work doest not belong to you, dude'
    end

    @userworks = Work.where(:user => current_user).where(:is_active => true).where.not(:id =>@work.id)
    @userworks.each do |wrk|

      wrk.is_active = false
      wrk.save!

    end

  end

  # POST /works
  # POST /works.json
  def create

    @work = current_user.works.build(work_params)

    respond_to do |format|
      if @work.save
        flash[:success] = "Work created!"
        format.html { redirect_to managecontent_path(current_user), notice: 'Work was successfully created.' }
        format.json { render :show, status: :created, location: @work }
      else
        format.html { render :new }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /works/1
  # PATCH/PUT /works/1.json

   def rate

     @work = Work.find params[:id]

     q_id = 0
     rating_value = 0

     params[:rating].each do |key, value|

       q_id = key
       rating_value = value

     end

     @newrating =  Rating.create(
         :question_id=>q_id,
         :work => @work,
         :author => current_or_guest_user,
         :score => rating_value
     )


     @newrating.validate!
     @newrating.errors.full_messages
     @newrating.save!



     respond_to do |format|
       format.js { render json: true }
       format.html { render :nothing => true, :notice => 'Update SUCCESSFUL!' }
     end

   end


  def update
    @work = Work.find params[:id]
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to managecontent_path(current_user), notice: 'Work was successfully updated.' }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work = Work.find(params[:id])
    if current_user != @work.user
      render :nothing => true, :notice => 'Work doest not belong to you, dude'
    end

    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url, notice: 'Work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

   def permitted_params
     params.permit!
   end

   def work_params
     params.permit!
   end
   #
   #
   # def rating_params
   #   params.require(:rating).permit(:score, :rating_type_id, :work, :author)
   # end
end
