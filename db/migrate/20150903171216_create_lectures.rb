class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.belongs_to :classroom, index: true, foreign_key: true
      t.string :title, default: "", null: false

      t.timestamps null: false
    end
  end
end
