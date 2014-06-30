RemoteFactoryGirlHomeRails.configure do |config|
  # Skip any controller methods in the test environment. (i.e. when running tests in 'client')
  # An authentication method is a likely candidate to skip
  config.skip_before_filter = [:authenticate]
end if defined?(RemoteFactoryGirlHomeRails)
