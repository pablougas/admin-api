class CompaniesController < ApplicationController
  before_action :authorize
  before_action :set_company, only: %i[ show update destroy user ]

  # GET /companies
  def index
    @companies = Company.all

    render json: @companies
  end

  # GET /companies/1
  def show
    users = @company.users
    projects = @company.projects
    .joins("INNER JOIN users a ON projects.owner_id = a.id")
    .joins("INNER JOIN users b ON projects.project_manager_id = b.id")
    .joins("INNER JOIN users c ON projects.designer_id = c.id")
  
    projects_with_users = projects.as_json(
      include: {
        owner: { only: [:id, :full_name, :email], methods: :full_name },  # Include owner details
        project_manager: { only: [:id, :full_name, :email], methods: :full_name },  # Include project manager details
        designer: { only: [:id, :full_name, :email], methods: :full_name }  # Include designer details
      }
    )
    render json: { legal_name: @company.legal_name, users: users, projects: projects_with_users }
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: :created, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end 
  
  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:legal_name, :phone)
    end
end
