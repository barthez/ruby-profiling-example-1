class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_objects

  view_cache_dependency { `git log -n1 --oneline app/views/`.split(' ').first }

  private

  def get_objects
    @employers = Employer.all
  end
end
