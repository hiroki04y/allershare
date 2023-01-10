class RemoveSendFromPersonalChats < ActiveRecord::Migration[7.0]
  def change
    drop_table :personal_chats do
    end
  end
end
