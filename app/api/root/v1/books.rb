module Root
  module V1
    class Books < Base::API
      format :json

      namespace :book do
        desc 'Add Book Record',
          success: [
            { code: 200, message: 'Successfully add book record.' }
          ],
          failure: [
            { code: 400, message: 'Bad Request' },
            { code: 408, message: 'Request Timeout' },
            { code: 500, message: 'Internal Server Error' },
            { code: 503, message: 'Service Unavailable' }
          ]

          get do
            Book.all
          end

        desc 'Add Book Record',
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
            requires :title, type: String, desc: 'Book Title'
          end

          post do
            declared_params
            # Book.create(title: params[:title])
          end
      end
    end
  end
end
