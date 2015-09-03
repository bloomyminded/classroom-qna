class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body, default: "", null: false
      t.references :user, index: true, foreign_key: true
      t.boolean :is_answered, default: false, null: false
      t.integer :num_comments, default: 0, null: false
      t.integer :upvotes, default: 0, null: false

      t.timestamps null: false
    end
  end
end
