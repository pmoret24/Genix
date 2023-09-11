class ChatroomsController < ApplicationController

  def index
    @chatrooms = policy_scope(Chatroom)
    if params[:query].present? # se tiver uma query presente executa esse metodo
      @chatrooms = @chatrooms.search_chatrooms(params[:query])
    end
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
    authorize @chatroom
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end
end
