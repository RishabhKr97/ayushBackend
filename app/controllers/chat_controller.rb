class ChatController < ApplicationController
  def index
  session[:conversations] ||= []

  #This statement could be removed when incorpated actually
  current_user = User.where(uid: params[:id])
  @users = User.all.where(uid: Conversation.opposed_user(current_user))
  @conversations = Conversation.includes(:recipient, :messages).find(session[:conversations])
  render json: {users:@users, conversations: @conversations }
  end

end
