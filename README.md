# README

Trying devise and devise jwt (Source: https://enlear.academy/how-to-create-a-rails-6-api-with-devise-jwt-46fa35085e85)

1. Add gem

  ```
    gem 'devise'
    gem 'devise-jwt'
  ```

2. Setup devise

  ```
    rails g devise:install
    rails g devise User
    rails db:migrate
  ```

3. Update `models/user.rb`.
4. Create another file `app/models/jwt_denylist.rb`
5. `rails g migration CreateJwtDenylist`
6. Update `db/migrate/20220504031626_create_jwt_denylist.rb`
7. `rails db:migrate`
8. Generate a secret key, add to gemfile
  `gem 'dotenv-rails', groups: [:development, :test]`
9. Generate secret key
  `rake secret`
10. Then create a `.env` file in the project root and add the secret key.
  `DEVISE_JWT_SECRET_KEY=<your_rake_secret>`
11. Update `config/initializers/devise.rb`
  ```
  config.jwt do |jwt|
    jwt.secret = ENV['DEVISE_JWT_SECRET_KEY']
    jwt.dispatch_requests = [
      ['POST', %r{^/sign_in$}]
    ]
    jwt.revocation_requests = [
      ['DELETE', %r{^/sign_out$}]
    ]
    jwt.expiration_time = 15.day.to_i
  end
  ```
12. When error on signup `ActionController::InvalidAuthenticityToken in Users::RegistrationsController#create` add the following on application_controller:
  `protect_from_forgery prepend: true`
