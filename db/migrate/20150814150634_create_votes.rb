class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :up, default: 0
      t.integer :down, default: 0
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
