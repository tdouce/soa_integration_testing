class User < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  belongs_to :school
end
