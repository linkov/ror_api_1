class Api::V1::ReviewpaymentsController < Api::ApiController
  # before_action :authenticate_user!

  def destroy
    rec = Reviewpayment.find(params[:id])
    rec.destroy
    render json: rec
  end


  def create
    rec = Reviewpayment.create(reviewpayment_params)
    sendout_expert_email(rec)
    render json:rec
  end


  def update
    rec = Reviewpayment.find(params[:id])
    rec.update(reviewpayment_params)

    render json:rec
  end

  def show
    @rec = Reviewpayment.find(params[:id])
    render json:@rec
  end


  def index

    @recs = Reviewpayment.all
    render json:@recs


  end

  def sendout_expert_email(payment)

    if payment.work_id
      work = Work.find(payment.work_id)
      user = User.find(payment.user_id)
      MandrillUserMailer.new_flex_review(user,work).deliver_now
    end

  end


  def reviewpayment_params
    params.require(:reviewpayment).permit!
  end

end
