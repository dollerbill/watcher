# frozen_string_literal: true

class InviteMailer < ApplicationMailer
  before_action { @invite = params[:invite] }

  def invite_email
    @name = @invite.invite_name
    @email = @invite.invite_email
    @user = @invite.invited_by_user
    @url = "#{invites_url}/#{@invite.token}"
    subject = "#{@user.name} has invited you to pick movies to watch with Watcher!"

    mail(to: @email, subject: subject)
  end
end
