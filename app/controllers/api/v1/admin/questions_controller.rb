class Api::V1::Admin::QuestionsController < Api::ApiController

  def index
    photo_package = Package.where(:code => "photo").first
    @questions = Question.where(:package =>photo_package)
    render json:@questions, each_serializer: Api::V1::QuestionAdminSerializer
  end


  def show
    @question = Question.find(params[:id])
    render json:@question, serializer: Api::V1::QuestionAdminSerializer, :root => 'question'
  end


  def update
    @question = Question.find(params[:id])
    @question.question_tags.delete(  @question.question_tags.where.not(:art_category_id => question_params['art_category_ids']) )
    respond_to do |format|
      format.json do
        if @question.update(question_params)
          render :json => @question, serializer: Api::V1::QuestionAdminSerializer, :root => 'question'
        else
          render :json => { :errors => @question.errors.messages }, :status => 422
        end
      end
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    respond_to do |format|
      format.json { render :json => {}, :status => :no_content }
    end
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      format.json do
        if @question.save
          render :json => @question, serializer: Api::V1::QuestionAdminSerializer, :root => 'question'
        else
          render :json => { :errors => @question.errors.messages }, :status => 422
        end
      end
    end
  end

  private

  def question_params
    params.require(:question).permit!
  end

end
