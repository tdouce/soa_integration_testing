class User < ActiveRecord::Base
  validates :first_name, :last_name, :school_id, presence: true
  belongs_to :school
end
