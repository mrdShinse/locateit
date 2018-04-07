# frozen_string_literal: true

class User < ApplicationRecord # :nodoc:
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :maps, dependent: :nullify

  def honorific_name
    if name.present?
      "#{name}さん"
    else
      '名無しさん'
    end
  end
end
