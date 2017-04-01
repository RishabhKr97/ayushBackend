class MessagesController < ApplicationController
 #def create
  #  @conversation = Conversation.find(params[:conversation_id])
   # @message = @conversation.messages.build(message_params)
   # @message.user_id = current_user.id
   # @message.save!

    #@path = conversation_path(@conversation)
    #render json: @path
 # end

  #private

 # def message_params
  #  params.require(:message).permit(:body)
 #end
  expose :message
      expose :messages, -> { Message.order(created_at: :desc).page(params[:page]).per(15) }


      def index
        render_api(messages)
      end


      def create
        message.save
        render_api(message, :created)
      end


      private


      def message_params
        params.require(:message).permit(:body, :user_id)
      end
 
end
