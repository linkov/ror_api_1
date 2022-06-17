source 'https://rubygems.org'

ruby '2.2.2'

# Core

gem 'rails', '4.2.2'
# gem 'turbolinks' remove for Ember
gem 'therubyracer'
gem 'activeadmin', git: 'https://github.com/activeadmin/activeadmin'
gem 'net-ssh'
gem 'chrome_logger' , :require => 'chrome_logger/railtie'
gem 'lograge'
gem 'rest-client'
gem 'sidekiq'

gem 'yt', '~> 0.28.0'

# Translation
gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'rails-4-x' # For 4.x
gem 'globalize', '~> 5.0.0'
gem 'globalize-accessors'
# gem 'locale_setter'
gem 'http_accept_language'

# Admin

gem 'ancestry'
gem "active_admin-sortable_tree"
gem 'active_admin_theme'
gem 'country_select'
gem 'groupdate'
gem 'hightop'
gem 'active_median'
gem 'chartkick'
gem 'best_in_place', github: 'bernat/best_in_place'

# Websockets
gem 'pusher'

# JS Front-end
gem 'active-model-adapter-source'

# Database
gem 'counter_culture', '~> 1.0'
gem 'mysql2', '~> 0.3.18'
gem 'seed_dump'
# gem "seedbank"
gem 'yaml_db'
gem 'activerecord-import', '~> 0.4.0'
# gem 'deep_cloneable', '~> 2.2.2'
gem 'amoeba'

# Authentication / Authorisation
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem "koala", "~> 2.2"

# gem 'devise_token_auth'
gem 'devise_token_auth', :git => "git://github.com/lynndylanhurley/devise_token_auth.git", :branch => "master"
# API

gem 'active_model_serializers', '~> 0.9.5'

# cross origin policy rack middleware
gem 'rack-cors', require: 'rack/cors'

# Assets

gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'mmenu-rails'
gem 'bootstrap-multiselect-rails'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'bxslider-rails'
gem 'bootstrap_form'

# Upload
gem 'file_validators'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'mini_magick',             '3.8.0'
gem 'fog',                     '1.26.0'
gem 'fog-aws'
gem 'aws-sdk'
gem 'carrierwave-video'
gem 'carrierwave-processing'


# Payment

gem 'stripe'


# Statistics

gem 'impressionist'
gem 'pickup'
gem 'descriptive_statistics', '~> 2.4.0', :require => 'descriptive_statistics/safe'
gem 'public_activity'

# Static content

gem 'high_voltage', '~> 2.3.0'


# Sharing

gem 'shareable'


# Pagination

gem 'will_paginate'


# Utils
# gem 'raygun4ruby'
gem "bugsnag"
# gem 'bugsnag-capistrano'

gem 'mandrill-api'
gem 'railroady'
gem 'httparty'
gem "ddtrace"

group :staging, :production do
  # gem 'passenger'
  gem 'remote_syslog_logger'
end


group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'

end

# Background tasks
gem 'sucker_punch', '~> 2.0'
gem 'whenever', :require => false

# Tests

gem 'rubocop', '~> 0.52.1', require: false

group :development, :test do
  gem 'rspec_junit_formatter'
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
end


# Activity view
