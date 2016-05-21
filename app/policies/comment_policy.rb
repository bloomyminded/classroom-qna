class CommentPolicy < ApplicationPolicy
  def destroy?
    (@user.has_role? :admin) || (@record.user_id == @user.id)
  end
end
