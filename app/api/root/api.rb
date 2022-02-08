module Root
  class API < Base::API
    mount Root::V1::API
  end
end
