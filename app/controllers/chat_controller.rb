class ChatController < ApplicationController
  def index
  session[:conversations] ||= []

  @users = User.all.where(id: interlocutor(current_user.conversations)
  @conversations = Conversation.includes(:recipient,:messages).find(session[:conversations])
  render json: @users, @conversations
  end

end
