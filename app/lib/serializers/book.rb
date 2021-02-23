# frozen_string_literal: true

module Serializers
  class Book < Base
    identifier :id

    fields :title, :author, :description

    field :link do |book, _options|
      protocol = "#{Rails.application.routes.default_url_options[:protocol]}://"
      host = Rails.application.routes.default_url_options[:host]
      default_url = protocol + host

      if Rails.application.routes.default_url_options[:port].present?
        default_url += ":#{Rails.application.routes.default_url_options[:port]}"
      end

      default_url + Rails.application.routes.url_helpers.rails_blob_path(book.link, only_path: true)
    end

    field :image do |book, _options|
      image_variant = book.image.variant(resize_to_fill: [200, 290]).processed
      Rails.application.routes.url_helpers.rails_representation_url(image_variant)
    end

    field :overall_rating do |book, _options|
      book.calc_rating
    end

    association :reviews, blueprint: Review
  end
end
