class ChatController < ApplicationController
  def index
  session[:conversations] ||= []
  
  current_user = User.where(uid: session[:id])
  @users = User.all.where(uid: conversation.opposed_user(current_user))
  @conversations = Conversation.includes(:recipient, :messages).find(session[:conversations])
  render json: {users:@users, conversations: @conversations }
  end

end
