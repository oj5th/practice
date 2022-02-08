module Root
  module V1
    class Book < Base::API
      format :json

      namespace :book do
        params do
          requires :title, type: String, desc: 'Book Title'
        end

        post do
          binding.pry
          # declared_params
          # Book.create(title: params[:title])
        end
      end
    end
  end
end
