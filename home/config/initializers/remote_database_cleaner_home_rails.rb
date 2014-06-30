RemoteDatabaseCleanerHomeRails.configure do |config|
  config.skip_before_filter = [:authenticate]
  config.strategy = :truncation
end if defined?(RemoteDatabaseCleanerHomeRails)
