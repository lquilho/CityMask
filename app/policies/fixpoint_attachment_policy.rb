class FixpointAttachmentPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    new?
  end

  def edit?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
