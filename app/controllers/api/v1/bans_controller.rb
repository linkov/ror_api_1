class Api::V1::BansController < ApplicationController


  def new
  end

  def create

    user = User.where(:uid => ban_params[:user_id]).first
    existing_ban = Ban.where(:question_id => ban_params[:question_id],:user_id => user.id).first

    if existing_ban
      return render :json => existing_ban
    end

    ban = Ban.create(:user_id => user.id, :question_id => ban_params[:question_id], :work_id => ban_params[:work_id])
    if ban.save

      number_of_bans = Ban.where(:question_id => ban_params[:question_id]).count

      # if number_of_bans >= 2
      #   question = Question.where(:id => ban_params[:question_id]).first
      #   question.banned = true
      #   question.save!
      # end

      render :json => ban
    else
      render :json => ban.errors
    end
    # # Amount in cents
    # # @amount = 500
    # #
    # customer = Stripe::Customer.create(
    #     :email => @current_user.email,
    #     :source  => params[:token][:id]
    # )
    #
    # charge = Stripe::Charge.create(
    #     :customer    => customer.id,
    #     :amount      => params[:amount],
    #     :description => 'Package customer',
    #     :currency    => 'eur'
    # )
    #
    # package = Package.find(params[:package_id])
    # @current_user.packages << package
    # render :json => params[:token]

  end

  private

  def ban_params
    params.require(:ban).permit!
  end


end
