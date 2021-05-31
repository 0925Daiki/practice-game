class MessagesController < ApplicationController
  
  def index
    @message = Message.new
    @game = Game.find(params[:game_id])
    @messages = @game.messages.includes(:user)
  end
  
  def create
    @game = Game.find(params[:game_id])
    @message = @game.messages.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, game_id: params[:game_id])
  end

end
