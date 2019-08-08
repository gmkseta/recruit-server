class TeamUsersController < ApplicationController

  def toggle
    @team = Team.find(params[:team_id])
    @main_captain = @team.team_users&.captain&.first&.user
    if current_user == @main_captain
      redirect_to team_path(@team)
    end
    team_user = TeamUser.where(user: current_user, team: @team).first
    if team_user
      team_user.destroy
    else
      TeamUser.create!(team: @team, user: current_user, role: :apply)
    end 
    respond_to do |format|
      format.json { render json: {is_new: team_user.nil?} }
    end
  end

end
