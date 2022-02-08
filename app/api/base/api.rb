module Base
  class API < Grape::API
    helpers do
      def declared_params
        @declared_params ||= declared(params, include_missing: false)
      end
    end
  end
end
