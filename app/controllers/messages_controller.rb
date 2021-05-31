class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_message, only: [:index, :create]

  def index
    @message = Message.new
    @messages = @game.messages.includes(:user)
  end
  
  def create
    @message = @game.messages.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, game_id: params[:game_id])
  end

  def set_message
    @game = Game.find(params[:game_id])
  end

end
