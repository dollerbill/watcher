# frozen_string_literal: true

Clearance.configure do |config|
  config.rotate_csrf_on_sign_in = true
  config.mailer_sender = 'mail@watcher-app.io'
end
