source 'http://rubygems.org'

gem 'rails', '3.1.1'

gem 'thin'

gem "haml",'3.1.4'
gem 'fastercsv' # Only required on Ruby 1.8 and below
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
gem "devise"
gem 'jquery-rails'

gem 'kaminari'
gem 'paperclip'


group :assets do
  gem 'sass-rails',   '3.1.4'
  gem 'compass-rails'  
  gem 'compass_twitter_bootstrap', :git => 'git://github.com/vwall/compass-twitter-bootstrap.git'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'mysql2'
  gem 'execjs'
  gem 'therubyracer'
end

group :development do
#  gem 'guard-livereload'
#  gem 'rack-livereload'
  gem "annotate"
  gem 'sqlite3'
  gem 'sqlite3-ruby'
  gem "faker"
  gem "populator"
end

group :test do
  gem 'turn', :require => false
end


