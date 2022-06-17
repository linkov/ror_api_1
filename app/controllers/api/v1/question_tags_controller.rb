class Api::V1::QuestionTagsController < Api::ApiController
  # before_action :authenticate_user!

  def show
    @rec = QuestionTag.find(params[:id])
    render json:@rec, serializer: Api::V1::QuestionTagSerializer, :root => 'question_tag'
  end


  def index

    if params[:question_id]
      @recs = QuestionTag.where(:question_id => params[:question_id])
    else
      @recs = QuestionTag.all
    end

    render json:@recs, each_serializer: Api::V1::QuestionTagSerializer


  end


  def question_link_params
    params.require(:question_link).permit!
  end

end
