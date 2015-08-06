class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   belongs_to :diet
   has_and_belongs_to_many :dishes
   has_and_belongs_to_many :intolerances

   has_many :friend_requests, dependent: :destroy
   has_many :pending_friends, through: :friend_requests, 
   source: :friend

end
