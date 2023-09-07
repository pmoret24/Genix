class ChatroomsController < ApplicationController
  def create
    @chatroom = Chatroom.new
    @chatroom.sender = current_user
    @chatroom.receiver = User.find(params[:receiver])
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render "users/show"
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
