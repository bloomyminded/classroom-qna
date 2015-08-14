class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :body
      t.boolean :answered, default: false

      t.timestamps null: false
    end
  end
end
