# frozen_string_literal: true

class InvitesController < ApplicationController
  before_action :set_invite, only: %i[show edit update]

  def create
    @invite = Invite.new(invite_params)
    binding.pry
    if @invite.save
      redirect_to invites_path
      # send_mail
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

  def show; end

  def update
    binding.pry
    user_params = {
      email: @invite.invite_email,
      password: params['invite']['password'],
      group_id: @invite.invited_by_user.group_id
    }
    user = User.new(user_params)
    binding.pry
    # send welcome email
    if user.save
      @invite.update(token: nil)
      # redirect_to root_path
      redirect_to new_user_path, params: { user: user_params }
      # redirect_to movies_path
    else
      render :edit
    end
  end

  private

  def set_invite
    @invite = Invite.find_by(token: params[:id])
  end

  def invite_params
    p = params.require(:invite).permit(:invite_email, :invite_name)
    p.merge(
      invited_by_user_id: current_user.id,
      # group_id: current_user.group_id,
      token: SecureRandom.hex(10),
      token_expires_at: 30.days.from_now
    )
  end
end
