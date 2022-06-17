class Api::V1::BackratesController < ApplicationController


  def index

    if params[:work_id]
      model = Backrate.where(:work_id => params[:work_id], :question_id => params[:question_id])
      render json:model
    else
      render json:Backrate.all
    end
  end

  def new
  end

  def create

    user = User.where(:id => backrate_params[:user_id]).first
    existing_model = Backrate.where(:work_id => backrate_params[:work_id], :question_id => backrate_params[:question_id],:user_id => user.id).first

    if existing_model
      existing_model.score = backrate_params[:score]
      return render :json => existing_model
    end

    model = Backrate.create(:score => backrate_params[:score], :user_id => user.id, :question_id => backrate_params[:question_id], :work_id => backrate_params[:work_id])
    if model.save

      render :json => model
    else
      render :json => model.errors
    end

  end


  def update


    @model = Backrate.find params[:id]


    if @model.update(backrate_params)
      render json: @model
    else
      render json: @model.errors, status: :unprocessable_entity
    end

  end

  private

  def backrate_params
    params.require(:backrate).permit!
  end


end
