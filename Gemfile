source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'httmultiparty', '~> 0.3.16'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'

group :development, :test do
  gem 'byebug'
  gem 'sqlite3'
end

group :test do
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'overcommit'
  gem 'rubocop'
end
