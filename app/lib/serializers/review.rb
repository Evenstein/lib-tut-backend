# frozen_string_literal: true

module Serializers
  class Review < Base
    identifier :id

    fields :text, :rate, :user, :created_at, :book
  end
end
