class CompanyUsersController < ApplicationController
  before_action :authorize
  before_action :set_company_user, only: %i[ show update destroy ]

  # GET /company_users
  def index
    @company_users = CompanyUser.all

    render json: @company_users
  end

  # GET /company_users/1
  def show
    render json: @company_user
  end

  # POST /company_users
  def create 
    @user = User.find_or_initialize_by(email: company_user_params[:user][:email])
    if @user.persisted? == false
      print "*"*50
      print "UPDATING USER ATTRS"
      @user.assign_attributes(company_user_params[:user])
    end
    @user.companies << Company.find(company_user_params[:company_id]) 
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /company_users/1
  def update
    if @company_user.update(company_user_params)
      render json: @company_user
    else
      render json: @company_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /company_users/1
  def destroy
    @company_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_user
      @company_user = CompanyUser.find(params[:id])
    end 

    # Only allow a list of trusted parameters through.
    def company_user_params
      params.require(:company_user).permit(:company_id, :user_id, user: [:first_name, :last_name, :email, :phone])
    end

     # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone)
    end
end
