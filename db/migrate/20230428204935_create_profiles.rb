class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.integer :role
      t.text :name

      t.timestamps
    end
  end
end
