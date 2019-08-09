class TeamUser < ApplicationRecord
  ROLES = %i{default apply rejected executive captain}
  TEAM_MEMBERS = %i{default executive captain}
  belongs_to :team
  belongs_to :user

  enum role: ROLES
  scope :members, -> {where(role: TEAM_MEMBERS)}

end
