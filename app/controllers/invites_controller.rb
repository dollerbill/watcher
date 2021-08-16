# frozen_string_literal: true

class InvitesController < ApplicationController
  before_action :set_invite, only: %i[show update destroy]

  def create
    @invite = Invite.new(invite_params)

    if @invite.save
      InviteMailer.with(invite: @invite).invite_email.deliver_now
      redirect_to invites_url
    else
      render :new
    end
  end

  def index
    @invites = Invite.where(invited_by_user: current_user).order(:created_at)
  end

  def new
    @invite = Invite.new
  end

  def destroy
    @invite.destroy
    redirect_to invites_url
  end

  def show; end

  def update
    @user = user_from_invite

    if @user.save
      @invite.update(token: nil, accepted_at: Time.now)
      sign_in @user
      redirect_to root_path
    else
      render template: 'users/new'
    end
  end

  private

  def set_invite
    @invite = if params['action'] == 'show'
                Invite.find_by(token: params['id'])
              else
                Invite.find_by(id: params['id'])
              end
  end

  def invite_params
    p = params.require(:invite).permit(:invite_email, :invite_name)
    p.merge(
      invited_by_user_id: current_user.id,
      token: SecureRandom.hex(10),
      token_expires_at: 30.days.from_now
    )
  end

  def user_from_invite
    invited_user = UsersController.new
    invited_user.request = request
    invited_user.response = response
    invited_user.params['user'] = ActionController::Parameters.new(
      {
        'name' => @invite.invite_name,
        'email' => @invite.invite_email,
        'password' => params['invite']['password'],
        'group_id' => @invite.invited_by_user.group_id
      }
    )
    invited_user.user_from_params
  end
end
