class ConnectionsController < ApplicationController
  before_action :set_connection, only: :destroy

  def create
    friend = User.find(params[:friend_id]) # passou a id do usuario ao qual o usuario logado quer ser amigo
    connection = Connection.new
    connection.user = current_user
    connection.friend = friend
    connection.save!
    redirect_to root_path
  end

  def update
    connection = Connection.find(params[:id])
    connection.update(status: true)
    redirect_to root_path, notice: "Connection Approved!"
  end

  def destroy
    connection = Connection.find(params[:id])
    connection.destroy
    redirect_to profiles_path
  end

end
