class ProfilesController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :skip_authorization, exept: :index
  before_action :skip_policy_scope, only: :index

  def show
    @connection = Connection.new
    @chatroom = Chatroom.new
    @chatroom_available = Chatroom.where(sender: current_user, receiver: @user).or(Chatroom.where(sender: @user, receiver: current_user)).first
    @pending_connections = Connection.where(status: false).where(friend: current_user)
    @approved_connections = Connection.where(status: true, user: current_user).or(Connection.where(status: true, friend: current_user))
    # o acima é essa query otimizada @approved_connections = Connection.where(status: true).where(user: current_user).or(Connection.where(status: true).where(friend_id: current_user))
    @connection_two = Connection.where(
      '(user_id = ? AND friend_id = ?) OR (user_id = ? AND friend_id = ?)',
      current_user.id, @user.id, @user.id, current_user.id
    ).where(status: true).first
  end

  def index
    @users = User.all
    if params[:query].present? # se tiver uma query presente executa esse metodo
      sql_subquery = "first_name ILIKE :query OR last_name ILIKE :query"
      @users = @users.where(sql_subquery, query: "%#{params[:query]}%")
    end
    # @users = User.search_by_first_name_and_last_name(params[:query]) if params[:query].present?
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:photo)
  end
end
