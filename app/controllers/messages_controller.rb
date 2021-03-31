class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(essage_params)
    if @message.save
      redirecto_to
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id)
  end
end
