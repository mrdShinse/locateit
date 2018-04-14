# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      omniauth = request.env['omniauth.auth']
      profile = SocialProfile.from_omniauth(omniauth)

      unless profile.persisted?
        profile.user = User.from_omniauth(omniauth) unless profile.user
        profile.save!
      end

      set_flash_message(:notice, :success, kind: :Facebook) if is_navigational_format?
      sign_in_and_redirect profile.user, event: :authentication
    end

    def failure
      redirect_to root_path
    end
  end
end
