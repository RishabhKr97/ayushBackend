class ConversationsController < ApplicationController
 def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    render json: { conversation_id: @conversation.id }
  end

  def show
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = @conversation.messages
    @message = Message.new
    render json: { recipient_id: @reciever, @messages, @message }
  end
  
  def add_to_conversations
    session[:conversations] ||= []
    session[:conversations] << @conversation.id
  end
  
  def close
    @conversation = Conversation.find(params[:id])
 
    session[:conversations].delete(@conversation.id)
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def interlocutor(conversation)
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end
end
