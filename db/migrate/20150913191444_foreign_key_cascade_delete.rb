class ForeignKeyCascadeDelete < ActiveRecord::Migration
  def change
    remove_foreign_key "comments", "questions"
    remove_foreign_key "comments", "users"
    remove_foreign_key "courses", "schools"
    remove_foreign_key "courses", "users"
    remove_foreign_key "lectures", "courses"
    remove_foreign_key "memberships", "courses"
    remove_foreign_key "memberships", "users"
    remove_foreign_key "questions", "lectures"
    remove_foreign_key "questions", "users"
    remove_foreign_key "users", "schools"
    remove_foreign_key "votes", "questions"
    remove_foreign_key "votes", "users"

    add_foreign_key "comments", "questions", on_delete: :cascade 
    add_foreign_key "comments", "users", on_delete: :cascade 
    add_foreign_key "courses", "schools", on_delete: :cascade 
    add_foreign_key "courses", "users", on_delete: :cascade 
    add_foreign_key "lectures", "courses", on_delete: :cascade 
    add_foreign_key "memberships", "courses", on_delete: :cascade 
    add_foreign_key "memberships", "users", on_delete: :cascade 
    add_foreign_key "questions", "lectures", on_delete: :cascade 
    add_foreign_key "questions", "users", on_delete: :cascade 
    add_foreign_key "users", "schools", on_delete: :cascade 
    add_foreign_key "votes", "questions", on_delete: :cascade 
    add_foreign_key "votes", "users", on_delete: :cascade 
  end
end
