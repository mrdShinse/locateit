# frozen_string_literal: true

class SocialProfile < ApplicationRecord
  belongs_to :user
  validates :uid, uniqueness: { scope: :provider }

  scope :from_omniauth, ->(auth) {
    find_or_initialize_by(provider: auth.provider, uid: auth.uid) do |profile|
      profile.email = auth.info.email
      profile.name = auth.info.name
      profile.nickname = auth.info.nickname
      profile.description = auth.info.description.try(:truncate, 255)
      profile.image_url = auth.info.image
      profile.raw_json = auth.to_json
    end
  }
end
