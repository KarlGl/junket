ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rails/test_help'
require 'junket'

Rails.backtrace_cleaner.remove_silencers!

RSpec.configure do |_config|

end