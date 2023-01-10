class Droppersonalchats < ActiveRecord::Migration[7.0]
  def change
    drop_table :personalchats do
    end
  end
end
