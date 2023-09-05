class ProfilesController < ApplicationController
  before_action :set_user, only: %i[show]
  def show
  end
  def index
    @users = User.all
  end
  private

  def set_user
    @user = User.find(params[:id])
  end

end
