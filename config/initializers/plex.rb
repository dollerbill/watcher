# frozen_string_literal: true

Plex.configure do |config|
  config.auth_token = ENV['PLEX_AUTH_TOKEN']
end
