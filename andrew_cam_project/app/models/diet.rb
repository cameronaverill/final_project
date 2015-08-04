class Diet < ActiveRecord::Base
	has_many :users, dependent: :destroy
end
