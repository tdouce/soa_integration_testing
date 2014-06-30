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

    it "should create test data in 'home' from 'client'" do
      user_created_from_client = RemoteFactoryGirl.create(:user, first_name: 'Sam')
      # Make http request to 'home' and retrieve all users
      all_users_in_home        = fetch_users
      user_from_home           = all_users_in_home.detect {|user| user['first_name'] == user['first_name']}

      expect(user_created_from_client['first_name']).to eq(user_from_home['first_name'])
    end

    describe 'associations' do
      it 'should be able to create associations using factories' do
        school_with_principal = RemoteFactoryGirl.create(:school_with_principal, name: 'Tift County High School')

        expect(school_with_principal['name']).to eq('Tift County High School')
      end

      it 'should be able to manually create an assocation between a user and a school' do
        school = RemoteFactoryGirl.create(:school, name: 'Tift County High School')
        user   = RemoteFactoryGirl.create(:user, first_name: 'Sam', last_name: 'Iam', school_id: school.fetch('id'))

        expect(school['name']).to eq('Tift County High School')
        expect(user['first_name']).to eq('Sam')
        expect(user['last_name']).to eq('Iam')
      end
    end
  end

  describe '.factories' do
    it 'should be able to retrieve a list of available factories' do
      available_factories = RemoteFactoryGirl.factories

      expect(available_factories['factories']).to match_array(['school_with_principal', 'user', 'school'])
    end
  end
end
