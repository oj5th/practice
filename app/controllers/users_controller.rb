class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @joined_on = @user.created_at.to_formatted_s(:short)

    if @user.current_sign_in_at
      @last_login = @user.current_sign_in_at.to_formatted_s(:short)
    else
      @last_login = 'never'
    end
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
    authorize! :edit, @item
  end

  # POST /users or /users.json
  def create
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    # That’s ok, but if we try and edit an existing user (e.g. http://localhost:3000/admin/users/1/edit), then we are prompted to set a new password every time we want to update something. This is not ideal.
    #
    # To get around this, we can take advantage of Devise’s update_without_password method.
    #
    # Alter the update method in UsersController as shown (making sure to include the protected method needs_password?):

    respond_to do |format|
      if user_params[:password].blank?
        user_params.delete(:password)
        user_params.delete(:password_confirmation)
      end

      successfully_updated =
        if needs_password?(@user, user_params)
          @user.update(user_params)
        else
          @user.update_without_password(user_params)
        end

      if successfully_updated
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation,
        :name,
        :role_id
      )
    end

    def needs_password?(_user, params)
      params[:password].present?
    end
end
