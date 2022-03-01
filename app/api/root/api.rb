module Root
  class API < Base::API
    mount Root::V1::API

    add_swagger_documentation
  end
end
