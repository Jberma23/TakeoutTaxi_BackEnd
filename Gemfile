source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"
gem 'dotenv-rails', groups: [:development, :test]
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
gem 'active_model_serializers'
gem 'geocoder'
# gem 'devise-jwt'
# gem 'fast_jsonapi'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.5', '>= 1.5.4'
gem 'sprockets', '~> 4.2', '>= 4.2.1'
gem 'sprockets-rails', '~> 3.4', '>= 3.4.2'
# Use Puma as the app server
gem 'puma'
gem 'devise_token_auth'
gem 'knock'
gem 'square.rb'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt'
gem 'jwt'
# Use ActiveStorage variant
gem 'mini_magick'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'devise'
gem 'bootsnap', require: false
gem 'pry'
gem 'json'
gem 'faker'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
gem 'rest-client'
gem "aws-sdk-s3", require: false
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
group :development do
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
  #  gem 'rack-cors', require: 'rack/cors'
 
end
group :production do
  # gem 'listen', '>= 3.0.5', '< 3.2'
  #  gem 'rack-cors', require: 'rack/cors'
 
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
