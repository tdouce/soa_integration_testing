require 'spec_helper'

# See spec/spec_helper.rb for configuring RemoteFactoryGirl (i.e. client) to 
# coordinate with RemoteFactoryGirlHomeRails (i.e. home)

describe 'working with RemoteFactoryGirl' do
  describe '#create' do

    # Requires that a factory be defined in 'home' with name 'user'
    it 'should be able to create a user' do
      user = RemoteFactoryGirl.create(:user)

      expect(user).to have_key('first_name')
    end

    # Requires that a factory be defined in 'home' with name 'user' and have #first_name
    # and #last_name attributes
    it 'should be able to create a user with custom attributes' do
      user = RemoteFactoryGirl.create(:user, first_name: 'Sam', last_name: 'Iam')

      expect(user['first_name']).to eq('Sam')
      expect(user['last_name']).to eq('Iam')
    end

    describe '.factories' do
      it 'should be able to retrieve a list of available factories' do
        available_factories = RemoteFactoryGirl.factories

        expect(available_factories['factories']).to match_array(['school_with_principal', 'user', 'school'])
      end
    end
  end
end
