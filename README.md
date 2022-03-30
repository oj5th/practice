# README

Source: https://hibbard.eu/authentication-with-devise-and-cancancan-in-rails/

* Setup RSPEC

```
group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

rails generate rspec:install

Setup FactoryBot
- Add file: spec/support/factory_bot.rb
- Add the following code:

  RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods
  end

- Add the following code on the very top in this file: src/spec/rails_helper.rb

  require 'support/factory_bot'
```
