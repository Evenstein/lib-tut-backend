# frozen_string_literal: true

module Validations
  module Books
    extend ActiveSupport::Concern

    included do
      with_options on: '/books/:id' do
        validates :title, :author, :description, :link, :image, presence: true
        validates :title, :author, length: { maximum: 128 }
        validates :description, length: { maximum: 5_000 }
      end
    end
  end
end
