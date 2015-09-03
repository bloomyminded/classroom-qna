class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false, default: ""
      t.references :user, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.boolean :is_deleted, null: false, default: false

      t.timestamps null: false
    end
  end
end
