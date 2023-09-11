class MembersController < ApplicationController
  before_action :set_member, only: :destroy
  before_action :set_project, only: %i[new create]
  before_action :skip_authorization

  def new
    @member = Member.new
  end

  def create
    @member = Member.new
    @member.project = @project
    @member.user = current_user
    @members_users = Member.where(project: @project)
    @members_count = Member.where(project: @project, user: current_user).count
    @members_approved = Member.where(project: @project, status: true, user: current_user).count
    @members_pending = Member.where(project: @project, status: false, user: current_user).count
    if @member.save
      redirect_to project_path(@project), notice: "Request Received"
    else
      render "projects/show", status: :unprocessable_entity
    end
  end

  def update
    @member = Member.find(params[:id])
    @member.update(status: true)
    redirect_to project_path(@member.project), notice: "Member Approved!"
  end

  def destroy
    @member.destroy
    redirect_to project_path(@member.project), status: :see_other
  end

  private

  def member_params
    params.require(:member).permit(:status, :user_id, :project_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
