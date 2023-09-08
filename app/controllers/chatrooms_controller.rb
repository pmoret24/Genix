class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.where(sender: current_user).or(Chatroom.where(receiver: current_user))
    if params[:query].present? # se tiver uma query presente executa esse metodo
      sql_subquery = "name ILIKE :query"
      @chatrooms = Chatroom.where(sql_subquery, query: "%#{params[:query]}%")
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
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
