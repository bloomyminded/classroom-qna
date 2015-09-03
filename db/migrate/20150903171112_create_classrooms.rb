class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.belongs_to :school, index: true, foreign_key: true
      t.string :name, null: false
      t.text :description, default: "", null: false
      t.integer :student_count, default: 0, null: false

      t.timestamps null: false
    end
  end
end
