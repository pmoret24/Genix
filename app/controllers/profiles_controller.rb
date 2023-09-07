class ProfilesController < ApplicationController
  before_action :set_user, only: %i[show]
  def show
    @connection = Connection.new

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
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:photo)
  end
end
