Mailgun.configure do |config|
  config.api_key = ENV['MAILGUN_API_KEY']
  @mg_client = Mailgun::Client.new
end
