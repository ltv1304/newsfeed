class RemoveReportTypeFieldInReport < ActiveRecord::Migration[7.0]
  def change
    remove_column :reports, :report_type
  end
end
