class Dropfollow < ActiveRecord::Migration[7.0]
  def change
    drop_table :Relationship do
    end
  end
end
