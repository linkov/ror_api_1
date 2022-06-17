class Api::V1::QTutorialsController < Api::ApiController

  # before_action :authenticate_user!


  def destroy
    rec = QTutorial.find(params[:id])
    rec.destroy
    render json: rec
  end


  def create
    rec = QTutorial.create(q_tutorial_params)
    render json:rec, serializer: Api::V1::QTutorialSerializer, :root => 'q_tutorial'
  end


  def update
    rec = QTutorial.find(params[:id])
    rec.update(q_tutorial_params)
    render json:rec, serializer: Api::V1::QTutorialSerializer, :root => 'q_tutorial'
  end


  def show
    @tut =  QTutorial.find(params[:id])
    render json:@tut, serializer: Api::V1::QTutorialSerializer, :root => 'q_tutorial'
  end


  def index
    if params[:question_id]
      render json:QTutorial.where(:question_id => params[:question_id]), each_serializer: Api::V1::QTutorialSerializer
    else
      render json:QTutorial.all, each_serializer: Api::V1::QTutorialSerializer
    end


  end

  def q_tutorial_params
    params.require(:q_tutorial).permit!
  end

end
