source "http://rubygems.org"

# Declare your gem's dependencies in your gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

gem 'hashie', git: 'git://github.com/bradgessler/hashie' # for deferred defaults

group :development, :test do
  gem 'pry'
end

group :test do
  gem 'rspec', '~> 2.11'
  gem 'guard'
  gem 'guard-rspec'
end
