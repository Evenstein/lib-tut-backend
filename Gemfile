# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Jquery gem
gem 'jquery-rails'
# Chosen gem
gem 'chosen-rails'
# Search gem
gem 'ransack', '~>2.3.2'
# Useful gem for JWT authorization
gem 'knock', github: 'nsarno/knock', branch: 'master', ref: '9214cd027422df8dc31eb67c60032fbbf8fc100b'
# JWT support for ruby
gem 'jwt', '~> 2.2.1'

# Use Active Storage variant
gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Rack::Cors provides support for Cross-Origin Resource Sharing (CORS) for
# Rack compatible web applications.
gem 'rack-cors', '~> 1.1.1'

# Swagger to Rails-based API's
gem 'rswag-api', '~> 2.3.1'
gem 'rswag-ui', '~> 2.3.1'
# Simple, Fast, and Declarative Serialization Library for Ruby
gem 'blueprinter', '~> 0.23.4'
# Optimized JSON
gem 'oj', '~> 3.10.6'
# Interactor provides a common interface for performing complex user interactions.
gem 'interactor', '~> 3.1.2'
# Add contracts to your interactors
gem 'interactor-contracts', '~> 0.3.0'
# Coercion and validation for data structures
gem 'dry-schema', '~> 1.5.1'
# Paginator
gem 'kaminari', '~> 1.2.1'
# Flexible authentication solution for Rails with Warden
gem 'devise', '~> 4.7.1'
# Alternative form DSL
gem 'simple_form', '~> 5.0.2'
# Slim provides ability to use slim as template language
gem 'slim', '~> 4.1.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Testing library
  gem 'rspec-rails', '~> 4.0.0'
  # Testing library to test API
  gem 'rswag-specs', '~> 2.3.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'

  # A Ruby static code analyzer and formatter, based on the community Ruby style guide.
  gem 'rubocop', '~> 1.10', require: false
  # A RuboCop extension focused on enforcing Rails best practices and coding conventions.
  gem 'rubocop-rails', '~> 2.9.1', require: false
  # Code style checking for RSpec files
  gem 'rubocop-rspec', '~> 2.2.0', require: false
  # Remote multi-server automation tool
  gem 'capistrano', '~> 3.14', require: false
  # Rails specific tasks for Capistrano v3
  gem 'capistrano-rails', '~> 1.5', require: false
  # Capistrano plugin which adds a remote rails console
  gem 'capistrano-rails-console', '~> 2.3.0', require: false
  # Bundler specific tasks for Capistrano.
  gem 'capistrano-bundler', '~> 1.1', require: false
  # Adds a task to restart your application after deployment via Capistrano.
  gem 'capistrano-passenger', '~> 0.2.0', require: false
  # RVM support for Capistrano
  gem 'capistrano-rvm', '~> 0.1.2', require: false
  gem 'capistrano-the-best-compression',
      github: 'SumatoSoft/capistrano-the-best-compression',
      require: false

  # Fast and powerful Git hooks manager for any type of projects.
  gem 'lefthook', '~> 0.7.1'

  # To deploy from gitlab. See https://github.com/net-ssh/net-ssh/issues/565
  gem 'bcrypt_pbkdf', '~> 1.0.1'
  gem 'ed25519', '~> 1.2.4'
end
