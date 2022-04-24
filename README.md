# README

* Steps (Reference: https://guides.railsgirls.com/backend-with-active-admin, https://github.com/activeadmin/activeadmin/blob/master/docs/0-installation.md)

  1. Add gem:
    ```
      gem 'devise'
      gem 'activeadmin'
      gem 'inherited_resources', github: 'activeadmin/inherited_resources'
    ```

  2. rails generate active_admin:install
  3. AdminUser.create(:email => 'oliver@example.com', :password => 'password', :password_confirmation => 'password')
  4. Login to localhost:3000/admin
  5. 
