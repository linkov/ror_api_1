class Api::V1::Admin::QuestionTagsController < Api::ApiController
  # before_action :authenticate_user!

  def create
    @model = QuestionTag.new(question_tag_params)
    respond_to do |format|
      format.json do
        if @model.save
          render :json => @model, serializer: Api::V1::QuestionTagSerializer, :root => 'question_tag'
        else
          render :json => { :errors => @model.errors.messages }, :status => 422
        end
      end
    end
  end



  def update
    rec = QuestionTag.find(params[:id])
    rec.update(question_tag_params)
    render json:rec, serializer: Api::V1::QuestionTagSerializer, :root => 'question_tag'
  end

  def show
    @rec = QuestionTag.find(params[:id])
    render json:@rec, serializer: Api::V1::QuestionTagSerializer, :root => 'question_tag'
  end


  def index

    if params[:question_id]
      @recs = QuestionTag.where(:question_id => params[:question_id],:art_category_id =>params[:art_category_id])
    else
      @recs = QuestionTag.all
    end

    render json:@recs, each_serializer: Api::V1::QuestionTagSerializer


  end


  def question_tag_params
    params.require(:question_tag).permit!
  end

end
