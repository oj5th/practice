module Root
  module V1
    class Users < Base::API
      format :json

      namespace :users do

        desc 'Authenticate user and return user object, access token',
          success: [
            { code: 201, message: 'Successfully add book record.' }
          ],
          failure: [
            { code: 400, message: 'Bad Request' },
            { code: 408, message: 'Request Timeout' },
            { code: 500, message: 'Internal Server Error' },
            { code: 503, message: 'Service Unavailable' }
          ]
          params do
            requires :email, :type => String, :desc => "User email"
            requires :password, :type => String, :desc => "User password"
          end

          post 'authenticate' do
            email = params[:email]
            password = params[:password]

            if email.nil? or password.nil?
              error!({:error_code => 404, :error_message => "Invalid email or password."}, 401)
              return
            end

            user = User.find_by(email: email.downcase)
            if user.nil?
              return {:error_code => 404, :error_message => "Invalid email or password."}
            end

            if !user.valid_password?(password)
              return {:error_code => 404, :error_message => "Invalid email or password."}
            else
              user.ensure_authentication_token!
              user.save
              return { status: 'ok', token: user.authentication_token }
            end
          end

        desc "Register user and return user object, access token",
          success: [
            { code: 201, message: 'Successfully add book record.' }
          ],
          failure: [
            { code: 400, message: 'Bad Request' },
            { code: 408, message: 'Request Timeout' },
            { code: 500, message: 'Internal Server Error' },
            { code: 503, message: 'Service Unavailable' }
          ]

          params do
            requires :email, :type => String, :desc => "Email"
            requires :password, :type => String, :desc => "Password"
          end
          post 'register' do
            user = User.new(
              password:   params[:password],
              email:      params[:email]
            )

            if user.valid?
              user.save
              return user
            else
              return {:error_code => 404, :error_message => "Invalid email or password."}
            end
          end

        desc "Logout user and return user object, access token",
          success: [
            { code: 201, message: 'Successfully add book record.' }
          ],
          failure: [
            { code: 400, message: 'Bad Request' },
            { code: 408, message: 'Request Timeout' },
            { code: 500, message: 'Internal Server Error' },
            { code: 503, message: 'Service Unavailable' }
          ]

          params do
            requires :token, :type => String, :desc => "Authentication Token"
          end

          delete 'logout' do
            user = User.find_by(authentication_token: params[:token])

            if !user.nil?
              user.remove_authentication_token!
              return { status: 'ok', token: user.authentication_token }
            else
              return {:error_code => 404, :error_message => "Invalid token."}
            end
          end
      end
    end
  end
end
