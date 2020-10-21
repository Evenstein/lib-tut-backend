# frozen_string_literal: true

module Validations
  module Books
    extend ActiveSupport::Concern

    included do
      with_options on: '/book' do
        validates :title, :author, :description, :link, :image, presence: true
        validates :title, :author, length: { maximum: 128 }
        validates :description, length: { maximum: 5_000 }
        validates :link, attached: true
        validates :image, attached: true, content_type: %i[png jpg jpeg],
                  size: { less_than: 1.megabytes }
      end
    end
  end
end
