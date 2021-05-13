class BikePolicy < ApplicationPolicy
  def index?
    if user.role == "admin" || "user"
      true
    end
  end

  def create?
    if user.role == "admin"
      true
    end
  end

  def new?
    create?
  end

  def update?
    if user.role == "admin"
      true
    end
  end

  def edit?
    update?
  end

  def destroy?
    if user.role == "admin"
      true
    end
  end
end
