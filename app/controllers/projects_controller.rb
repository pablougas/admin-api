class ProjectsController < ApplicationController
  before_action :authorize
  before_action :set_project, only: %i[ show update destroy ]
  before_action :set_company, only: %i[ create ]

  # GET /projects
  def index
    @projects = Project.all

    render json: @projects
  end

  # GET /projects/1
  def show
    render json: @project
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    @project.company_id = @company.id
    if @project.save
      print "*"*50
      print(@project) 
      print "*"*50
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def set_company
      @company = Company.find(params[:company_id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:user_id, :company_id, :name, :owner_id, :project_manager_id, :designer_id, :start_date, :projected_start_date, :end_date, :projected_end_date)
    end
end
