# frozen_string_literal: true

class Book < ApplicationRecord
  include Validations::Books

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :reviews, dependent: :restrict_with_error
  has_one_attached :link
  has_one_attached :image

  accepts_nested_attributes_for :tags

  scope :fetch_by_tag_name, ->(name) { joins(:tags).merge(Tag.fetch_by_name(name)) }

  class << self
    def tagged_with(name)
      Tag.find_by!(name: name).books
    end

    def tag_counts
      Tag.select('tags.*, count(taggings.tag_id) as count')
         .joins(:taggings).group('taggings.tag_id')
    end
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map { |name| Tag.where(name: name.strip).first_or_create! }
  end

  def calc_rating
    rates = Review.where(book: self).pluck(:rate)
    return nil if rates.empty?

    (rates.sum.to_f / rates.length).round(1)
  end

  private

  def link_attached
    return if link.attached?

    errors.add(:link, ' file should be attached')
  end

  # rubocop:disable Style/GuardClause
  def image_attached
    if image.attached?
      correct_image_mime_type
    else
      errors.add(:image, ' should be attached')
    end
  end

  def correct_image_mime_type
    unless image.content_type.in?(%w[image/png image/jpg image/jpeg])
      errors.add(:image, 'must be a JPG or a PNG or a JPEG file')
    end
  end
  # rubocop:enable Style/GuardClause
end
