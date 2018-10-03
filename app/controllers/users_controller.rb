class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = @client.users.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create

    @user = @client.users.create(user_params)
    # if @user.save
    #   render json: @user, status: :created, location: @user
    # else
    #   render json: @user.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /users/1
  def update
    
    @user.name    = params[:name] if  params[:name].present?
    @user.email   = params[:email] if  params[:email].present?
    @user.phone   = params[:phone] if  params[:phone].present?
    @user.user_id = params[:user_id] if  params[:user_id].present?

    if  @client.users.save(@user)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @client.users.delete(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = @client.users.find(:id => params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:name,:email, :user_id, :phone)
    end
end
