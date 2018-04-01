# frozen_string_literal: true

class HomeController < ApplicationController # :nodoc:
  def index
    @maps = Map.order(id: :desc).limit(20)
    @yours = current_user.maps.order(id: :desc).limit(20) if user_signed_in?
  end
end
