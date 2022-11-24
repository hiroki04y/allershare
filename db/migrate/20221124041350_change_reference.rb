class ChangeReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :chat_messages, :user, foreign_key: true
  end
end
