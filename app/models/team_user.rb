class TeamUser < ApplicationRecord
  ROLES = %i{default apply rejected executive captain}
  TEAM_MEMBERS = %i{default executive captain}
  belongs_to :team
  belongs_to :user

  enum role: ROLES
  scope :members, -> {where(role: TEAM_MEMBERS)}

  def make_color
    case self.role
      when 'captain'
        color = "primary"
      when 'executive'
        color = "success"
      when 'default'
        color = "secondary"
    end
    return color
  end

end
