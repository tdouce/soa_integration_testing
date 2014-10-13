require 'spec_helper'

# 1. See spec/spec_helper.rb for configuring RemoteFactoryGirl (i.e. client) to 
#    coordinate with RemoteFactoryGirlHomeRails (i.e. home)
#     - https://github.com/tdouce/soa_integration_testing/blob/master/client/spec/spec_helper.rb#L28
# 2. Requires that factories be set up correctly in 'home'
#     - https://github.com/tdouce/soa_integration_testing/tree/master/home/spec/factories
#
describe 'working with RemoteFactoryGirl' do
  describe '#create' do
    context 'with remote "home_1"' do
      it 'should be able to create a user' do
        user           = RemoteFactoryGirl.with_remote(:home_1).create(:user)
        user_from_home = fetch_user_by_id_from_home(user['id'])

        expect(user['first_name']).to eq(user_from_home['first_name'])
      end

      it 'should be able to create a user with custom attributes' do
        user           = RemoteFactoryGirl.with_remote(:home_1).create(:user, first_name: 'Sam')
        user_from_home = fetch_user_by_id_from_home(user['id'])

        expect(user['first_name']).to eq(user_from_home['first_name'])
      end

      describe 'associations' do
        it 'should be able to create associations using factories' do
          school_with_principal = RemoteFactoryGirl.with_remote(:home_1).create(:school_with_principal, name: 'Tift County High School')
          school_from_home      = fetch_school_by_id_from_home(school_with_principal['id'])
          user_from_home        = fetch_user_by_id_from_home(school_with_principal['id'])

          expect(school_with_principal['name']).to eq(school_from_home['name'])
          expect(school_with_principal['id']).to eq(user_from_home['id'])
        end

        it 'should be able to manually create an assocation between a user and a school' do
          school           = RemoteFactoryGirl.with_remote(:home_1).create(:school, name: 'Tift County High School')
          user             = RemoteFactoryGirl.with_remote(:home_1).create(:user, first_name: 'Sam', last_name: 'Iam', school_id: school.fetch('id'))
          school_from_home = fetch_school_by_id_from_home(school['id'])
          user_from_home   = fetch_user_by_id_from_home(user['id'])

          expect(school['name']).to eq(school_from_home['name'])
          expect(user['first_name']).to eq(user_from_home['first_name'])
          expect(user['school_id']).to eq(school['id'])
        end
      end
    end


      end


      end
    end
  end

  describe '.factories' do
    context 'with remote "home_1"' do
      it 'should be able to retrieve a list of available factories' do
        available_factories = RemoteFactoryGirl.with_remote(:home_1).factories

        expect(available_factories['factories']).to match_array(['school_with_principal', 'user', 'school'])
      end
    end

    end
  end
end
