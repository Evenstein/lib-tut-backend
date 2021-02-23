# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :taggings, dependent: :restrict_with_error
  has_many :books, through: :taggings

  validates :name, uniqueness: { case_sensitive: false }

  scope :fetch_by_name, ->(genres) { where(name: genres.keys) }
end
