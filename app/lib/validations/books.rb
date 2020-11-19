# frozen_string_literal: true

module Validations
  module Books
    extend ActiveSupport::Concern

    included do
      with_options on: '/book' do
        validates :title, :author, :description, presence: true
        validates :title, :author, length: { maximum: 128 }
        validates :description, length: { maximum: 5_000 }
        validate :link_attached
        validate :image_attached
      end
    end
  end
end
