class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
    @game = Game.all.order("id DESC")
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    if @game.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def game_params
    params.require(:game).permit(:recruit_id, :place_id, :battle_level_id, :comment).merge(user_id: current_user.id)
  end




end
