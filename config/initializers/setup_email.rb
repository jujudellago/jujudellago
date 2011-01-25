ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = false
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => false,
  :address => "mail.yabo-concept.ch",
  :port => 25,
  :domain => "yabo-concept.ch",
  :user_name => "julien@yabo-concept.ch",
  :password => "kristina",
  :authentication => :login
}
