class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.where(sender: current_user).or(Chatroom.where(receiver: current_user))
  end

  def create
    @chatroom = Chatroom.new
    @chatroom.sender = current_user
    @chatroom.receiver = User.find(params[:profile_id])
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
