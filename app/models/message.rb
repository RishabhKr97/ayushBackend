class Message < ApplicationRecord
 ##  belongs_to :conversation
 ## belongs_to :user

  #validates_presence_of :body, :conversation_id, :user_id
  #after_create_commit { MessageBroadcastJob.perform_later(self) }

  validates :body, :sender , presence: true

      after_create :broadcast

      private

      def broadcast
        ActionCable.server.broadcast('chat', as_json.merge(action: 'CreateMessage'))
      end
 end
