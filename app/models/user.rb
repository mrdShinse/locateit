# frozen_string_literal: true

class User < ApplicationRecord # :nodoc:
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_many :maps, dependent: :nullify
  has_many :social_profiles, dependent: :nullify
  validate :map_count

  scope :from_omniauth, ->(auth) {
    find_or_create_by(email: auth.info.email) do |user|
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  }

  def honorific_name
    if name.present?
      "#{name}さん"
    else
      '名無しさん'
    end
  end

  private

  def map_count
    errors.add(:maps, "地図は#{maximum_map_count}個までしか作れません。") if maps.count > maximum_map_count
  end

  def maximum_map_count
    5
  end
end
