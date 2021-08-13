class InviteMailer < ApplicationMailer
  before_action { @invite = params[:invite] }

  default from: 'invite@cinepick.io'

  def invite_email
    @name = @invite.invite_name
    @email = @invite.invite_email
    @user = @invite.invited_by_user
    @url = "#{invites_url}/#{@invite.token}"
    subject = "billy has invited you to pick movies to watch with Watcher!"
    # subject = "#{@user.name} has invited you to pick movies to watch with Watcher!"
    mail(to: @email, subject: subject)
  end
end
