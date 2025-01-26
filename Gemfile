source "https://rubygems.org"

ruby "3.3.5"

gem "rails", "~> 7.1.5", ">= 7.1.5.1"
gem "sprockets-rails"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem 'devise', '~> 4.9', '>= 4.9.4'
gem "sassc-rails"
gem 'pg', '~> 1.5', '>= 1.5.9'
gem 'faker'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console"
  gem 'pg', '~> 1.5', '>= 1.5.9'
end

group :production do
  gem 'pg', '~> 1.5', '>= 1.5.9'
  gem 'rails_12factor', '~> 0.0.3'
  gem 'sassc-rails'
  gem 'uglifier', '>= 1.3.0'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
