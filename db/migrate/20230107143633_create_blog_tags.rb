class CreateBlogTags < ActiveRecord::Migration[7.0]
  def change
    create_table :blog_tags do |t|
      t.string :name
    end
  end
end
