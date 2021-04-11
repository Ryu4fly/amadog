class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def new?
    create?
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def edit?
    true
  end
end
