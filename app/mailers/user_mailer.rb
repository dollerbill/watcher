# frozen_string_literal: true

class UserMailer < ApplicationMailer
  before_action { @user = params[:user] }

  def welcome_email
    @url = sign_in_url
    mail(to: @user.email, subject: 'Welcome to Watcher')
  end
end
