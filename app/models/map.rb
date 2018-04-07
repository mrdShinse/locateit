# frozen_string_literal: true

class Map < ApplicationRecord # :nodoc:
  belongs_to :user, validate: true
  has_many :pins, dependent: :destroy

  validates :name, presence: true
  validates :pins, length: { maximum: 5, too_long: 'ピンは%{count}個までしか作れません。' }
end
