class User < ApplicationRecord
  has_many :conversations, :foreign_key => :sender_id
end
