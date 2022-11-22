class DropChat < ActiveRecord::Migration[7.0]
  def change
    drop_table :chat_messages do
    end
  end
end
