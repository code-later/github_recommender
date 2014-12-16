source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'simple_form'

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
group :development do
  gem 'foundation-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'spring'
  gem 'pry-rails'
  gem 'dotenv-rails'
end

gem 'guacamole', git: 'https://github.com/triAGENS/guacamole.git', branch: 'implement-gharial-support'
gem 'octokit'
gem 'omniauth-github'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'puma'
gem 'invoker'
gem 'sidekiq'
gem 'sidekiq-status'
gem 'sinatra', '>= 1.3.0', :require => nil

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :production do
  gem 'rails_12factor'
end
