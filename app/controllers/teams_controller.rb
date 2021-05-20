class TeamsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :create]

  def index
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def team_params
    params.require(:team).permit(:area_id, :member_id, :team_level_id, :profile).merge(user_id: current_user.id)
  end

end
