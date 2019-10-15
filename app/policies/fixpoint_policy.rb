class FixpointPolicy < ApplicationPolicy
  def show?
    true
  end

  def new?
    true
  end

  def create?
    new?
  end

  def set_fixed?
    user.admin?
  end

  def update?
    true
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.where.not(latitude: nil, longitude: nil)
    end
  end
end
