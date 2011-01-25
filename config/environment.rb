# Load the rails application
require File.expand_path('../application', __FILE__)
require 'string_tools'

# Initialize the rails application
Casein::Application.initialize!

#ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(
#  :default => '%m/%d/%Y',
#  :my_date_format  => "%m/%d/%Y %I:%M%p"
#)


