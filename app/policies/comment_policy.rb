class CommentPolicy < ApplicationPolicy
  def destroy?
    @user.has_role? :admin
  end
end
