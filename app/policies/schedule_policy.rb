class SchedulePolicy < ApplicationPolicy
  def index?
    if user.role == "admin" || "user"
      true
    end
  end

  def show
    if user.role == "admin" || "user"
      true
    end
  end

  def create?
    if user.role == "admin" || "user"
      true
    end
  end

  def new?
    create?
  end

  def destroy?
    if user.role == "admin"
      true
    end
  end
end
