require 'spec_helper'

# TODO: Add links when repo is available on github
#
# 1. See spec/spec_helper.rb for configuring RemoteDatabaseCleaner (i.e. client) to
#    coordinate with RemoteFactoryGirlHomeRails (i.e. home)
# 2. Requires that factories be set up correctly in 'home'
#
describe 'working with RemoteDatabaseCleaner' do
  describe '#clean' do

    # RemoteDatabaseCleaner is configured to clean 'home' db before each spec.
    # See spec/spec_helper
    it 'should clean database before each spec' do
      user = RemoteFactoryGirl.create(:user)

      expect(fetch_users_from_home.length).to eq(1)

      RemoteDatabaseCleaner.clean

      expect(fetch_users_from_home.length).to eq(0)
    end
  end
end
