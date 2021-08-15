# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def invite_email
    # binding.pry
    @name = params[:invite_name]
    @email = params[:invite_email]
    @user = params[:user]
    @url = "#{users_url}/group_id=#{@user.group_id}"
    @url2 = "#{users_path}/group_id=#{@user.group_id}"
  end

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  # before_action :set_inviter_and_invitee
  # before_action { @account = params[:inviter].account }
  #
  # default to:       -> { @invitee.email_address },
  #         from:     -> { common_address(@inviter) },
  #         reply_to: -> { @inviter.email_address_with_name }
  #
  # def account_invitation
  #   mail subject: "#{@inviter.name} invited you to their Basecamp (#{@account.name})"
  # end
  #
  # def project_invitation
  #   @project    = params[:project]
  #   @summarizer = ProjectInvitationSummarizer.new(@project.bucket)
  #
  #   mail subject: "#{@inviter.name.familiar} added you to a project in Basecamp (#{@account.name})"
  # end
  #
  # private
  #
  # def set_inviter_and_invitee
  #   @inviter = params[:inviter]
  #   @invitee = params[:invitee]
  # end
end
