source 'http://rubygems.org'

gem 'rails', '3.1.1'

gem "haml",'3.1.4'
gem 'fastercsv' # Only required on Ruby 1.8 and below
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
gem "devise"
gem 'jquery-rails'

group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'less-rails-bootstrap', '2.0.4'  
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg'
end

group :development do
  gem "annotate"
  gem 'sqlite3'
  gem 'sqlite3-ruby'
  gem "faker"
  gem "populator"
end

group :test do
  gem 'turn', :require => false
end


