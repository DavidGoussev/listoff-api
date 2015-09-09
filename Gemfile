source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
gem 'pg'
group :production do

  gem 'rails_12factor'
end

group :development do
  # gem 'sqlite3'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

#Puma Ruby webserver, built for high concurrency, Heroku-recommended - replaces Webrick.
group :development, :production do
gem 'puma'
end

#object-creation for Rails testing
gem 'factory_girl_rails', '~> 4.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

#lists all table fields in Model file
gem 'annotate'

#authentication solution (user accounts. password generation, login handling)
gem 'devise'

#encapsulates sensitive password information to ENV variables, from dev to production
gem 'figaro', '1.0'

#object oriented authorization (credentialing for specific app creation/editing based on user roles)
gem 'pundit'

#markdown text
gem 'redcarpet'

#image management
gem 'carrierwave'
gem 'mini_magick'

# support for Amazon S3 image storage
gem 'fog'

#pagination
gem 'will_paginate', '~> 3.0.5'

#added as per Checkpoint32 - seeding
gem 'faker'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

#New Relic adds performance monitoring
gem 'newrelic_rpm'

#task scheduler
gem 'whenever', :require => false

#serialization for JSON
gem 'active_model_serializers', '0.9.2'

#testing frameworks
group :development, :test do
  gem 'rspec-rails', '~> 3.0'
#capybara tests user interactivity with app
  gem 'capybara'
end

group :doc do
  gem 'sdoc', require: false
end

# Use Twitter Bootstrap for CSS framework.
gem 'bootstrap-sass'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
