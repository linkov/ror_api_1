class Api::V1::WebnotificationflowsController < Api::ApiController
  before_action :authenticate_user!


  def markread
    flow =  Webnotificationflow.find(params[:id])
    current_user.webnotificationflows << flow
    render json: flow

  end

  def index

    if params[:route]
      @models = Webnotificationflow.where(:route => params[:route]).where.not(:id => current_user.webnotificationflows.collect(&:id))
      if @models.length > 0
        render json:@models.first
      else
        render json:[]
      end

      # @models = @models.joins(:users).where.not(:users => {:id => current_user.id})
    else
      @models = Webnotificationflow.all
      render json:@models
    end



  end

  def show
    render json: Webnotificationflow.find(params[:id])
  end

end
