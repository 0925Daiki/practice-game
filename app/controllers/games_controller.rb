class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :new, :show, :edit, :update, :destroy]
  before_action :set_game, only:[:show, :edit, :update, :destroy, :search]

  def index
    @team = Team.all
    @game = Game.all.order("id DESC")
    @q = Game.ransack
    @games = @q.result(distinct: true)
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
    @message = Message.all
  end

  def edit
    if user_signed_in? && current_user.id != @game.user_id 
      redirect_to action: :new
    end
  end

  def update
    if @game.update(game_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @game.destroy
    redirect_to action: :index
  end

  def search
    @q = Game.ransack(search_params)
    @games = @q.result(distinct: true)
  end

  private

  def game_params
    params.require(:game).permit(:practice_date, :recruit_id, :place_id, :battle_level_id, :comment).merge(user_id: current_user.id)
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def search_params
    params.require(:q).permit(:place_id_eq)
  end

end
