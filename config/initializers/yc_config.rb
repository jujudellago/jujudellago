WillPaginate::ViewHelpers.pagination_options[:renderer] = 'PaginationListLinkRenderer'



SERVER_CONFIG=YAML.load_file("#{Rails.root}/config/yc_config.yml")['server_'+RAILS_ENV]   
SITE_NAME=SERVER_CONFIG['site_name']
SITE_URL=SERVER_CONFIG['site_url']
COMPANY_NAME=SERVER_CONFIG['company_name']
ADMIN_EMAIL=SERVER_CONFIG['admin_email']
SUPPORT_NAME=SERVER_CONFIG['support_name']
SUPPORT_EMAIL=SERVER_CONFIG['support_email']
TAGLINE=SERVER_CONFIG['tagline']
KEYWORDS=SERVER_CONFIG['keywords']
DESCRIPTION=SERVER_CONFIG['description']
YOUTUBE_API_KEY=SERVER_CONFIG['youtube_api_key']
GOOGLEMAPS_API_KEY=SERVER_CONFIG['googlemaps_api_key']

ENV['RECAPTCHA_PUBLIC_KEY']  = SERVER_CONFIG['recaptcha_public_key']
ENV['RECAPTCHA_PRIVATE_KEY'] = SERVER_CONFIG['recaptcha_private_key_key']

if defined? Geokit
	Geokit::Geocoders::google = GOOGLEMAPS_API_KEY
end
