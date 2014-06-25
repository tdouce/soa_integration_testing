class School < ActiveRecord::Base
  validates :name, :city, :state, presence: true
  has_many :users
end
