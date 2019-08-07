class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :team_params, only: %i[create update]
  before_action :load_object, only: %i[show edit update destroy]
  def index
    @teams = Team.all
  end
  
  def new
    @team = Team.new
  end
  
  def create
    @team = Team.create!(team_params)
    TeamUser.create!(team: @team, user: current_user, role: :captain)
    redirect_to team_path(@team)
  end
  
  def show
    @main_captain = @team.team_users.captain.first.user
    
  end

  def edit
    
  end

  def update
    @team.update_attributes!(team_params)
    redirect_to team_path(@team)
  end

  def destroy
    @team.destroy
    redirect_to teams_path, notice: "팀을 삭제했습니다."
  end

  private
  def load_object
    @team = Team.find(params[:id])
  end
  
  def team_params
    params.fetch(:team,{}).permit(:name, :description)
  end

end
