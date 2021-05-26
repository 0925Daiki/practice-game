class TeamsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :show, :edit]

  def index
    @team = Team.all.order("id DESC")
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
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
    if user_signed_in? && current_user.id != @team.user_id 
      redirect_to action: :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:area_id, :member_id, :team_level_id, :profile).merge(user_id: current_user.id)
  end

end
