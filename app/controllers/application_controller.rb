class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!

  helper_method :admin?

  def admin?
    current_user.role == "admin"
  end
end
