ActionMailer::Base.default_url_options = {
  host: 'api.megamek.org',
  protocol: 'https'
}

Rails.application.config.action_mailer.smtp_settings = {
  address: CREDS[:smtp][:address],
  port: CREDS[:smtp][:port],
  authentication: :login,
  user_name: CREDS[:smtp][:user_name],
  password: CREDS[:smtp][:password],
  doman: CREDS[:smtp][:domain],
  enable_starttls_auto: true,
}
