class CreateReport < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.integer :blog_id
      t.text :title
      t.text :report

      t.timestamps
    end
  end
end
