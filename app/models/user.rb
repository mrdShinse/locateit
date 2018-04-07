# frozen_string_literal: true

class User < ApplicationRecord # :nodoc:
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :maps, dependent: :nullify
  validates :maps, length: { maximum: 5, too_long: '地図は%{count}個までしか作れません。' }

  def honorific_name
    if name.present?
      "#{name}さん"
    else
      '名無しさん'
    end
  end
end
