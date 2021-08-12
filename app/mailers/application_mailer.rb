# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'signup@watcher-app.io'
  layout 'mailer'
end
