class RemoveUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :chat_messages, :user, :integer
  end
end
