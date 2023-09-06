class ProfilesController < ApplicationController
  before_action :set_user, only: %i[show]
  def show
    @connection = Connection.new
    @connections_current_user = Connection.where(user: current_user) # array of connections which users are the current user
    @connection_two = Connection.where(user: current_user, friend: @user).first # ta pegando o primeiro active record de conexoes entre esses dois usuarios
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
