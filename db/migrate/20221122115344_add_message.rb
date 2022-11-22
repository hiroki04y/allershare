class AddMessage < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :room, :integer, foreign_key: true
    add_column :messages, :user, :integer, foreign_key: true
  end
end
