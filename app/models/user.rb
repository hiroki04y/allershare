class User < ApplicationRecord
    has_many :chat_message
    validates :name, {uniqueness: true,presence: true}
    validates :email, {uniqueness: true,presence: true}
    validates :password, {presence: true}
end
