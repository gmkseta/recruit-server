class User < ApplicationRecord
  has_many :team_users, dependent: :destroy
  belongs_to :team, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   def my_team?(team)
     team_roles = %i( default executive captain )
     TeamUser.where(user: self, team: team, role: team_roles).present? ? true : false
   end

   def captain?(team)
     self == team.team_users&.captain&.first&.user ? true : false
   end

end
