class CreateChatMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_messages do |t|
      t.integer :room_id
      t.integer :send_id
      t.integer :pair_id
      t.text :messasge

      t.timestamps
    end
  end
end
