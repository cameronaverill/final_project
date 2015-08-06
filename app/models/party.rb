class Party < ActiveRecord::Base
	has_and_belongs_to_many :dishes
	has_and_belongs_to_many :users

	validates :name, :location, :date, presence: true
end
