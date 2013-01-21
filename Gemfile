if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'https://rubygems.org'

gem 'rails', '3.2.9'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass'
  gem 'haml-rails'
  gem 'uglifier', '>= 1.0.3'
end

gem 'activerecord-oracle_enhanced-adapter'
gem 'ruby-oci8'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-ui-themes'
gem 'devise'
gem 'activeadmin'
gem "will_paginate", :git => "https://github.com/p7r/will_paginate.git", :branch => "rails3"

group :test, :development do
  gem 'rspec-rails'
  gem 'capistrano'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'spork', '1.0.0rc3'
  gem 'guard-spork'
end
