class AddTypeToReports < ActiveRecord::Migration[7.0]
  def change
    add_column :reports, :type, :integer
  end
end
