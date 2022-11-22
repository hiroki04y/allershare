class ChangeMessages < ActiveRecord::Migration[7.0]
  def change
    rename_table :messages, :chat_messages
  end
end
