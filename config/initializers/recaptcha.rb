
SC=YAML.load_file("#{Rails.root}/config/yc_config.yml")['server_'+RAILS_ENV]
Recaptcha.configure do |config|
  config.public_key  = SC['recaptcha_public_key']
  config.private_key = SC['recaptcha_private_key_key']
end

