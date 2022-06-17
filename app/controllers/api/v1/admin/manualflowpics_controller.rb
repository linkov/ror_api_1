class Api::V1::Admin::ManualflowpicsController < Api::ApiController
  # before_action :authenticate_user!

  def destroy
    rec = Manualflowpic.find(params[:id])
    rec.destroy
    render json: rec
  end


  def create
    rec = Manualflowpic.create(manualflowpic_params)
    render json:rec, serializer: Api::V1::ManualflowpicSerializer, :root => 'manualflowpic'
  end


  def update
    rec = Manualflowpic.find(params[:id])
    rec.update(manualflowpic_params)
    render json:rec, serializer: Api::V1::ManualflowpicSerializer, :root => 'manualflowpic'
  end

  def show
    @rec = Manualflowpic.find(params[:id])
    render json:@rec, serializer: Api::V1::ManualflowpicSerializer, :root => 'manualflowpic'
  end


  def index

    if params[:work_id]
      @recs = Manualflowpic.where(:work_id => params[:work_id])
    else
      @recs = Manualflowpic.all
    end

    render json:@recs, each_serializer: Api::V1::ManualflowpicSerializer


  end


  def manualflowpic_params
    params.require(:manualflowpic).permit!
  end

end
