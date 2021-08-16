# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'Watcher@watcher.fun'
  layout 'mailer'
end
