# frozen_string_literal: true

class UsersController < Clearance::UsersController
  before_action :set_user, only: %i[show update]

  def create
    @user = user_from_params
    @user.group_id = Group.create.id
    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver_now
      sign_in @user
      redirect_back_or url_after_create
    else
      # render json: @user.errors
      render :new
    end
  end

  def user_from_params
    super
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # TODO: disable account
  # def destroy
  #   @user.destroy
  #   redirect_to users_url, notice: 'User was successfully destroyed.'
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :group_id, streaming_services: [])
  end
end
