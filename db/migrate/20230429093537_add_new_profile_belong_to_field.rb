class AddNewProfileBelongToField < ActiveRecord::Migration[7.0]
  def change
    change_table :profiles do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true
    end
  end
end
