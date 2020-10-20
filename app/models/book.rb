# frozen_string_literal: true

class Book < ApplicationRecord
  include Validations::Books

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_one_attached :link
  has_one_attached :image

  accepts_nested_attributes_for :tags

  scope :fetch_by_tag_name, -> (name) { joins(:tags).merge(Tag.fetch_by_name(name)) }

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
end
