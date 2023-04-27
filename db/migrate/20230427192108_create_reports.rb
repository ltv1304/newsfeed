class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.text :title
      t.text :content
      t.text :report_type, default: 'report'
      t.integer :editions_count, default: 0

      t.timestamps
    end
  end
end
