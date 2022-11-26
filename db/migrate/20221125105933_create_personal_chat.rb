class CreatePersonalChat < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_chats do |t|
      t.text :content
      t.references :send, foreign_key: true
      t.references :pair, foreign_key: true

      t.timestamps
    end
  end
end
