source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.3'

# Assets
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'

# Authentication
gem 'sorcery'

# Database
gem 'mysql2', '>= 0.4.4'

# Application server
gem 'puma', '~> 4.1'

# UI/UX
gem 'jbuilder', '~> 2.7'
gem 'slim-rails'
gem 'rails-i18n', '~> 6.0.0'
gem 'config'

# Rakuten_book_api
gem 'rakuten_web_service'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  # Debugger
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "better_errors"
  gem "binding_of_caller"
  gem 'pry', '~> 0.12.2'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'

  # Code analyze
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'rails_best_practices', require: false
  gem 'reek'
  gem 'rspec_junit_formatter'

  # rubyのコードチェック
  gem 'rubocop', require: false
  # Railsのコードチェック
  gem 'rubocop-rails', require: false
  gem 'scss_lint', require: false
  gem 'slim_lint'

  # test
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'webdrivers', '~> 4.0'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

