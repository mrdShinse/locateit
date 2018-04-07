# frozen_string_literal: true

class Pin < ApplicationRecord # :nodoc:
  belongs_to :map

  validates :name, presence: true
end
