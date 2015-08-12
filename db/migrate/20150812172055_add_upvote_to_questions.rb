class AddUpvoteToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :upvote, :integer
  end
end
