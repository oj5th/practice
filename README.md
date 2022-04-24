# README

* Steps (Reference: https://guides.railsgirls.com/backend-with-active-admin, https://github.com/activeadmin/activeadmin/blob/master/docs/0-installation.md)

  1. Add gem:
    ```
      gem 'devise'
      gem 'activeadmin'
      gem 'inherited_resources', github: 'activeadmin/inherited_resources'
    ```

  2. `rails generate active_admin:install`
  3. `AdminUser.create(:email => 'oliver@example.com', :password => 'password', :password_confirmation => 'password')``
  4. Login to http://localhost:3000/admin
  5. `rails g model Book title author`
  6. `rails db:migrate`
  7. `rails g active_admin:resource Book` (Note: run `rails db:migrate` first before running this. Else error will occur.)
  8. Open `app/admin/books.rb` and uncomment `permit_params :title, :author`
