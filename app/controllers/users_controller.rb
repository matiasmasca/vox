# encoding: utf-8
class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user , only: [ :index , :show , :edit , :update , :destroy ]
  before_action :check_property ,  only: [ :index , :show , :edit , :update , :destroy ]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @organizer = @user.organizer
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user , notice: 'Usuario registrado correctamente.' }
        format.json { render 'show' , status: :created, location: @user }
      else
        format.html { render 'new' }
        format.json { render json: @user.errors , status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # Para que devise no de error si falta el pass.
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user , notice: 'Información actualizada correctamente.' }
        format.json { head :no_content }
      else
        format.html { render 'edit' }
        format.json { render json: @user.errors , status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to :back , status: 303 , notice: 'Usuario borrado correctamente.' }
      # format.html { redirect_to users_url, notice: 'Usuario borrado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if !params[:id].blank?
        @user = User.find_by_id(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit( :usuario , :nombre , :apellido , :email , :facebook , :twitter , :tipo_usuario_id , :password , :password_confirmation )
    end

    def check_property
      return true if @current_user.is_admin?

      if !params[:id].blank?
          @user = User.find_by_id(params[:id])
        else
          @user = nil
      end

      unless @user == @current_user
          respond_to do |format|
            format.html do
              unless @user == @current_user
                redirect_to(root_path, alert: 'Solo puedes operar sobre el usuario que tu hayas creado.')
                return
              end
            end
          end
        end
    end
end