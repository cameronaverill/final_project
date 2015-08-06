class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   belongs_to :diet
   has_and_belongs_to_many :dishes
   has_and_belongs_to_many :intolerances

   has_many :friendables
   has_many :users, through: :friendables

   def remove_friend(friend)
    current_user.friends.destroy(friend)
   end

end
