class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :city, null: false
      t.string :state, null: false
      t.integer :zip, null: false
      t.boolean :is_paid, default: false, null: false

      t.timestamps null: false
    end
  end
end
