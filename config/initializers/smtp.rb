# Load SMTP settings from /config/smtp.yml

if ActionMailer::Base.delivery_method == :smtp
  settings = YAML::load File.open(Rails.root.join 'config', 'smtp.yml')
  ActionMailer::Base.smtp_settings = settings if settings
end
