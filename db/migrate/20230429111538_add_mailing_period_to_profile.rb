class AddMailingPeriodToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :mailing_period, :integer, :default => 1
  end
end
