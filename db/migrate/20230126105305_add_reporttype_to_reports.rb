class AddReporttypeToReports < ActiveRecord::Migration[7.0]
  def change
    rename_column :reports, :type, :repotype
  end
end
