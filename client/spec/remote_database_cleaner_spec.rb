require 'spec_helper'

# 1. See spec/spec_helper.rb for configuring RemoteDatabaseCleaner (i.e. client) to
#    coordinate with RemoteFactoryGirlHomeRails (i.e. home)
#     - https://github.com/tdouce/soa_integration_testing/blob/master/client/spec/spec_helper.rb#L37
#
describe 'working with RemoteDatabaseCleaner' do
  describe '#clean' do
    it 'should clean database before each spec' do
      user = RemoteFactoryGirl.create(:user)

      expect(fetch_users_from_home.length).to eq(1)

      RemoteDatabaseCleaner.clean

      expect(fetch_users_from_home.length).to eq(0)
    end
  end
end
