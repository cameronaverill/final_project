class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   belongs_to :diet
   has_and_belongs_to_many :dishes
   has_and_belongs_to_many :intolerances

   has_many :friendships
       has_many :passive_friendships, :class_name => "Friendship", :foreign_key => "friend_id"

       has_many :active_friends, -> { where(friendships: { approved: true}) }, :through => :friendships, :source => :friend
       has_many :passive_friends, -> { where(friendships: { approved: true}) }, :through => :passive_friendships, :source => :user
       has_many :pending_friends, -> { where(friendships: { approved: false}) }, :through => :friendships, :source => :friend
       has_many :requested_friendships, -> { where(friendships: { approved: false}) }, :through => :passive_friendships, :source => :user


       def friends
         active_friends | passive_friends
       end

   def remove_friend(friend)
    current_user.friends.destroy(friend)
   end

end
