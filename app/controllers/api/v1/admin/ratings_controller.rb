class Api::V1::Admin::RatingsController < Api::ApiController

  before_action :authenticate_user!


  def destroy
    rec = Rating.find(params[:id])
    rec.destroy
    render json: rec
  end


  def open
    work = Work.find(params[:work_id])
    open_questions = work.questions.where.not(:id => Rating.where(:work_id => work.id).collect(&:question_id))
    opencount = open_questions.count-1
    if opencount < 0
      opencount = 0
    end
    render json:{open:opencount}

  end


  def create
    user = User.find(params[:rating][:author_id])
    params[:rating][:author_id] = user.id
    rec = Rating.where(:author_id => user.id, :work_id => params[:rating][:work_id],:question_id => params[:rating][:question_id]).first
    if rec
      rec.update(rating_params)
    else
      rec = Rating.create(rating_params)
    end


    render json:rec, serializer: Api::V1::RatingSerializer, :root => 'rating'
  end


  def update
    rec = Rating.find(params[:id])
    user = User.find(params[:rating][:author_id])
    params[:rating][:author_id] = user.id

    rec.update(rating_params)
    render json:rec, serializer: Api::V1::RatingSerializer, :root => 'rating'

  end





  def show
    @rec=  Rating.find(params[:id])
    render json:@rec
  end


  def index
    if params[:user_id]
      rating = Rating.where(:author_id => params[:user_id], :work_id => params[:work_id], :question_id => params[:question_id])
      render json:rating, each_serializer: Api::V1::RatingSerializer
    else
      render json:Rating.all
    end

  end

  def rating_params
    params.require(:rating).permit!
  end

end
