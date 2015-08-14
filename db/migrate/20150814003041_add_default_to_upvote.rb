class AddDefaultToUpvote < ActiveRecord::Migration
  def change
    change_column_default(:questions, :upvote, 0)
  end
end
