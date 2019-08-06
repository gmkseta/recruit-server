class TeamUser < ApplicationRecord
  ROLES = %i{default executive captain}
  belongs_to :team
  belongs_to :user

  enum role: ROLES
end
