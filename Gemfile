source 'https://rubygems.org'
ruby '1.9.3' #Versión de Ruby.
#ruby-gemset=GemasVox

gem 'rails', '4.0.1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0' 
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

group :assets do
  #Agrega Bootstrap-saas
  #gem 'sass-rails', '>= 3.2' # sass-rails needs to be higher than 3.2
  gem 'bootstrap-sass', '~> 3.1.1'
end

group :development do
  gem 'guard'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'guard-rails'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :test do
  gem 'cucumber-rails' , require: false
# gem 'cucumber-rails-training-wheels' # some pre-fabbed step definitions. web_steps.rb
  gem 'database_cleaner' # to clear Cucumber's test database between runs
  gem 'capybara'         # lets Cucumber pretend to be a web browser
  gem 'launchy'          # a useful debugging aid for user stories
  gem 'rspec-rails'
  gem 'rspec-expectations' # Para usar rspec en cucumber y que entienda .should
  gem 'shoulda-matchers' #para rspec use should extras como has_many
end

# Servicio de covertura de test y estadisticas.
gem 'coveralls', require: false

group :production do
  #heroku pide esto.
  #ruby '1.9.3'
  gem 'pg' #base de datos
  gem 'rails_12factor' #algo de heroku para archivos estaticos.
end