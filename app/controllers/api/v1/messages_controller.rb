class Api::V1::MessagesController < Api::ApiController
  respond_to :json
  before_action do

    if params[:message]
      @conversation = Conversation.find(params[:message][:conversation_id])
    end

    if params[:conversation_id]
      @conversation = Conversation.find(params[:conversation_id])
    end
  end


  def show
    @message = Message.find(params[:id])

    if @message.user_id != current_user.id
      @message.read = true
      @message.save
    end

    render json:@message
  end

  def index

    if @conversation
      @messages = @conversation.messages
      if @messages.length > 10
        @over_ten = true
        @messages = @messages[-10..-1]
      end
      if params[:m]
        @over_ten = false
        @messages = @conversation.messages
      end
      if @messages.last
        if @messages.last.user_id != current_user.id
          @messages.last.read = true;
        end
      end
      # @message = @conversation.messages.new
      render json:@messages

    else

      render json: []

    end



  end
  def new
    @message = @conversation.messages.new
  end
  def create

    can_send_message = ( @conversation.messages.where(:user_id =>@conversation.recipient_id).count > 0 || @conversation.messages.count == 0)
    if @conversation.recipient_id == current_user.id
      can_send_message = true
    end
    if !can_send_message
      render json: { :errors => [{title:"Wait until this person replies for the first time"}] }, :status => 422  and return
    end


    @message = @conversation.messages.new(message_params)
    if @message.save

      render json:@message
    end
  end
  private
  def message_params
    params.require(:message).permit(:body, :user_id,:read, :user_id, :conversation_id)
  end
end
