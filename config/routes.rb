Rails.application.routes.draw do
  devise_for :users
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  mount Root::API => '/api'
end
