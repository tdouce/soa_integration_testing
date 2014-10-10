class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate

  private

  # An authentication method that exists only to demonstrate that methods can be
  # skipped by configuring RemoteFactoryGirlHomeRails and RemoteDatabaseCleanerHomeRails
  #   - https://github.com/tdouce/soa_integration_testing/blob/master/home/config/initializers/remote_factory_girl_home_rails.rb
  #   - https://github.com/tdouce/soa_integration_testing/blob/master/home/config/initializers/remote_database_cleaner_home_rails.rb
  #
  # `unless params[:just_retrieving_resources_to_prove_they_exist_in_client_test]`
  # exists only to allow the 'client' to fetch resources from 'home' to prove that
  # resources are being created in 'home' from the 'client'
  #   - https://github.com/tdouce/soa_integration_testing/blob/master/client/spec/spec_helper.rb#L59
  #   - https://github.com/tdouce/soa_integration_testing/blob/master/client/spec/remote_factory_girl_spec.rb#L13
  #
  def authenticate
    unless params[:just_retrieving_resources_to_prove_they_exist_in_client_test]
      render json: { errors: ['You are not authorized'] }, status: :unauthorized
    end
  end

end
