class Api::V1::Admin::WorksController < Api::ApiController

  before_action :authenticate_user!

  def update


    @work = Work.find params[:id]


    if @work.update(work_params)
      sendout_user_email_if_needed(@work)
      render json: @work
    else
      render json: @work.errors, status: :unprocessable_entity
    end

  end

  def sendout_user_email_if_needed(work)

    if work.expertrated
      work.reviewmailed = true
      work.save!
      MandrillUserMailer.new_rates_mvp(work,current_user).deliver_now
    end

  end

  def index

    models = Work.where(:manualflow => true)

    if params[:reviewer]

      workpayment_ids = Reviewpayment.where(:user_id => params[:reviewer]).collect(&:work_id)
      works = models.where(:id => workpayment_ids)
      render json: works.sort_by{|work| [work.created_at] }.reverse(), each_serializer: Api::V1::WorkAdminSerializer

    else
      render json:models, each_serializer: Api::V1::WorkAdminSerializer
    end

  end

  def show
    render json: Work.find(params[:id]), serializer: Api::V1::WorkSerializer, :root => 'work'
  end


  def work_params
    # params.require(:work).permit(:title, :description, :is_visible, :emo_point, :idea_point, :tech_point, :package_ids, :work_category_id, :focu_id, {pics: []})
     params.require(:work).permit!
  end


end
