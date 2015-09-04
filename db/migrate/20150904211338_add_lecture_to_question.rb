class AddLectureToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :lecture, index: true, foreign_key: true
  end
end
