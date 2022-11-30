class CreateFollowuser < ActiveRecord::Migration[7.0]
  def change
    create_table :follow_users do |t|
      t.references :user1, foreign_key: true
      t.references :user2, foreign_key: true

      t.timestamps
    end
  end
end
