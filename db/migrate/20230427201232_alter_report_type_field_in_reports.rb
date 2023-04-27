class AlterReportTypeFieldInReports < ActiveRecord::Migration[7.0]
  change_table :reports do |t|
    t.change :report_type, :integer, default: 0
  end
end
