class TeamsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :show, :edit, :destroy]
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @team = Team.all.order("id DESC")
    @game = Game.all
    @q = Team.ransack(search_params)
    @teams = @q.result(distinct: true)
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

  def edit
    if user_signed_in? && current_user.id != @team.user_id 
      redirect_to action: :new
    end
  end

  def update
    if @team.update(team_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to action: :index
  end

  def search
    @q = Team.ransack(search_params)
    @teams = @q.result(distinct: true)
  end

  private

  def team_params
    params.require(:team).permit(:area_id, :member_id, :team_level_id, :profile).merge(user_id: current_user.id)
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def search_params
    params.permit(:area_id_eq)
  end


end
