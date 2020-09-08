class ApplicationController < ActionController::Base
  layout :authenticated_scope

  private

  def authenticated_scope
    user_signed_in? ? "application" : "public"
  end
end
