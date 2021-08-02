# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Watcher::Application.config.action_mailer.delivery_method = :mailgun
Watcher::Application.config.action_mailer.mailgun_settings = {
  api_key: ENV['MAILGUN_API_KEY'],
  domain: ENV['MAILGUN_DOMAIN']
}
