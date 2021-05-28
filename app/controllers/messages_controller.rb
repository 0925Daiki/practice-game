class MessagesController < ApplicationController
  def create
    @message = Message.create(message_params)
    if @message.save
      redirect_to game_path(@message.game)
    else
      @game = @message.game
      @message = @game.messages
      render "games/show"
    end

  end

  private

  def message_params
    params.permit(:text).merge(user_id: current_user.id, game_id: params[:game_id])
  end

end
