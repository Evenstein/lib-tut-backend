# frozen_string_literal: true

module Serializers
  class User < Base
    view :normal do
      fields :id, :email
    end
  end
end
