class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate

  private

  # An authentication method that you might want to skip while running tests in 'client'
  def authenticate
    raise 'You are not authenticated!' unless params[:just_retrieving_users_to_prove_they_exist_in_test]
  end
end
