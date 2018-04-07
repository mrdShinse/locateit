# frozen_string_literal: true

class Pin < ApplicationRecord # :nodoc:
  belongs_to :map, validate: true

  validates :name, presence: true
end
