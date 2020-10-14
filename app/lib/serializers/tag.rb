# frozen_string_literal: true

module Serializers
  class Tag < Base
    identifier :id

    fields :name
  end
end
