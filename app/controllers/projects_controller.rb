class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @projects = Project.all
    @projects = Project.search_projects(params[:query]) if params[:query].present?
  end

  def show
    @member = Member.new
    @members_users = Member.where(project: @project)
    @members_count = Member.where(project: @project, user: current_user).count
    @members_approved = Member.where(project: @project, status: true, user: current_user).count
    @members_pending = Member.where(project: @project, status: false, user: current_user).count
  end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.new(project_params)
    @project.owner = current_user

    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: "Project was successfully destroyed.", status: :see_other
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :category, :languages, :github, :photo)
  end
end
