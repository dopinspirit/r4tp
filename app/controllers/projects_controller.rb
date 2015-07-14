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

  def index
    @projects = Project.all
  end

  private

  def project_params
    params.require(:project).permit(:name, :tasks)
  end

end
