# frozen_string_literal: true

class InvitesController < ApplicationController
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

  private

  def invite_params
    p = params.require(:invite).permit(:invite_email, :invite_name)
    p.merge(invited_by_user_id: current_user.id, group_id: current_user.group_id)
  end
end
