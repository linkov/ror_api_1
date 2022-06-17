class Api::V1::QuestionLinksController < Api::ApiController
  # before_action :authenticate_user!

  def destroy
    rec = QuestionLink.find(params[:id])
    rec.destroy
    render json: rec
  end


  def create
    rec = QuestionLink.create(question_link_params)
    render json:rec, serializer: Api::V1::QuestionLinkSerializer, :root => 'question_link'
  end


  def update
    rec = QuestionLink.find(params[:id])
    rec.update(question_link_params)
    render json:rec, serializer: Api::V1::QuestionLinkSerializer, :root => 'question_link'
  end

  def show
    @rec = QuestionLink.find(params[:id])
    render json:@rec, serializer: Api::V1::QuestionLinkSerializer, :root => 'question_link'
  end


  def index

    if params[:question_id]
      @recs = QuestionLink.where(:question_id => params[:question_id])
    else
      @recs = QuestionLink.all
    end

    render json:@recs, each_serializer: Api::V1::QuestionLinkSerializer


  end


  def question_link_params
    params.require(:question_link).permit!
  end

end
