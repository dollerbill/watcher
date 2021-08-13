# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'watcher@watcher.fun'
  layout 'mailer'
end
