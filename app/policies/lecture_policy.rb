class LecturePolicy < ApplicationPolicy
  def create?
    (@user.has_role? :admin) || (@user.has_role? :instructor)
  end

  def update?
    (@user.has_role? :admin) || (@user.has_role? :instructor)
  end

  def destroy?
    (@user.has_role? :admin) || (@user.has_role? :instructor)
  end
end
