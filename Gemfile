source 'http://rubygems.org'

gem 'rails', '~> 3.1.0.rc'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# Asset template engines
gem 'sass-rails', "~> 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'

gem 'jquery-rails'
gem 'haml-rails'
gem 'formtastic', '~> 2.0.0.rc'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

# Use guard to automatically run specs and restart spork when needed
group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'growl'
  gem 'rb-fsevent'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda'
end

group :test do
  gem 'webrat'
    # Pretty printed test output
  gem 'turn', :require => false
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'machinist', '~> 2.0.0.beta'
  gem 'faker'
  gem 'spork', '~> 0.9.0.rc'
  gem 'guard-cucumber'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'growl'

end
