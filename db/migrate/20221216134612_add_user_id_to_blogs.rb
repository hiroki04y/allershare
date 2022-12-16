class AddUserIdToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :UserID, :string
  end
end
