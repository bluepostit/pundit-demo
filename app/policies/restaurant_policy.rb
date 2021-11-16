class RestaurantPolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    true
  end

  def update?
    # is the current user the owner of the record (restaurant instance)?
    is_owner? || user.admin?
  end

  def destroy?
    is_owner?
  end

  def is_owner?
    user == record.user
  end

  class Scope < Scope
    def resolve
      scope.all
      # scope.where(user: user)
    end
  end
end
