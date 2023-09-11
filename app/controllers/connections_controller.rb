class ConnectionsController < ApplicationController
  before_action :skip_authorization

  def create
    friend = User.find(params[:friend_id]) # passou a id do usuario ao qual o usuario logado quer ser amigo
    connection = Connection.new
    connection.user = current_user
    connection.friend = friend
    connection.save!
    redirect_to profiles_path, notice:"Connection Invite sent to #{connection.friend.first_name}!"
  end

  def update
    connection = Connection.find(params[:id])
    connection.update(status: true)
    redirect_to profile_path(current_user), notice: "Connection Approved with #{connection.user.first_name}!"
  end

  def destroy
    connection = Connection.find(params[:id])
    connection.destroy
    redirect_to profile_path(current_user), notice: "Connection deleted!", status: :see_other
  end
end
