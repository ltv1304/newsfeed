class RemoveProfileBelongToField < ActiveRecord::Migration[7.0]
  def change
    change_table :profiles do |t|
      t.remove_references :user
    end
  end
end
