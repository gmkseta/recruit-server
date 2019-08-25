class User < ApplicationRecord
  has_many :team_users, dependent: :destroy
  belongs_to :team, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :teams, through: :team_users, source: :team

  has_many :answer_sheets

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def my_team?(team)
    team_roles = TeamUser::TEAM_MEMBERS
    TeamUser.where(user: self, team: team, role: team_roles).present? ? true : false
  end

   def captain?(team)
     self == team.team_users&.captain&.first&.user ? true : false
   end

   def manager?(team)
     # self.team_users.where(team: team)
     # #manager.include?(team.team_users.where(user: self)&.first&.role) ? true : false
     # team.team_users.where(user: self)&.first&.role) ? true : false
      self.team_users.where("team_id=? and role >= ?", team.id, TeamUser.manager_role_index).present?
   end

end
