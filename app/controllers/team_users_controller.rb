class TeamUsersController < ApplicationController
  before_action :load_object, except: :toggle

  def toggle
    @team = Team.find(params[:team_id])
    if current_user.captain?(@team)
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

  def change_role
    @team_user.update_attributes(role: params[:role])
    redirect_back(fallback_location: root_path)
  end

  def accept
    @team_user.executive!
  end

  def refuse
    @team_user.rejected!
  end

  def destroy
    @team_user.destroy
  end

  private
  def load_object
    @team_user = TeamUser.find params[:id]
  end
end
