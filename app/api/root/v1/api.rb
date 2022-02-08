module Root
  module V1
    class API < Base::API
      version :v1

      mount Root::V1::Book
    end
  end
end
