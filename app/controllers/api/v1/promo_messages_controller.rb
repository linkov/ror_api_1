class Api::V1::PromoMessagesController < ApplicationController

  def index

    if params[:ratecount]


      if current_user
        @messages = PromoMessage.where(:target_rate_count => params[:ratecount]).where.not(:id => current_user.promo_messages.collect(&:id))
        first_message = @messages.first

        if first_message
          current_user.promo_messages << first_message
          current_user.save!
        end

        render json:@messages

      else
        render json:[]
      end

    else

      @messages = PromoMessage.all
      render json:@messages
    end

  end

  def show
    render json: PromoMessage.find(params[:id])
  end

end
