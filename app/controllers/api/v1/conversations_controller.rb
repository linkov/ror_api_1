class Api::V1::ConversationsController < Api::ApiController
  before_action :authenticate_user!
  serialization_scope :view_context


  def show
    render json: Conversation.find(params[:id])
  end


  def index

    if params[:question]
      @conversations = Conversation.where(:question_id => params[:question],:recipient_id =>params[:recipient],:work_id =>params[:work_id]).first

    else
      @conversations = Conversation.where('recipient_id=? OR sender_id=?', current_user.id, current_user.id)
    end

    render json:@conversations ? @conversations : []
  end

  def create
    conversations = Conversation.where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", conversation_params[:sender_id],conversation_params[:recipient_id], conversation_params[:recipient_id],conversation_params[:sender_id])
    work_conversation = conversations.where(:work_id => conversation_params[:work_id],:question_id => conversation_params[:question_id] ).first
    if work_conversation
      @conversation = work_conversation
    else
      work = Work.find(conversation_params[:work_id])
      question = Question.find(conversation_params[:question_id])
      @conversation = Conversation.create!({work:work,question:question,recipient_id:conversation_params[:recipient_id],sender_id:conversation_params[:sender_id]})
    end

    render json:@conversation
    # redirect_to conversation_messages_path(@conversation)
  end
  private
  def conversation_params
    params.require(:conversation).permit!
  end
end
