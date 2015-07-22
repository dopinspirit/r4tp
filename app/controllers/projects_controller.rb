class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create

    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render :new
    end


  end

  def show
    @project = Project.find(params[:id])
    unless current_user.can_view?(@project)
      redirect_to new_user_session_path
      return
    end
  end

  def index
    @projects = Project.all
  end

  private

  def project_params
    params.require(:project).permit(:name, :tasks, :id)
  end

end
