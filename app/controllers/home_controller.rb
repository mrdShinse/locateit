# frozen_string_literal: true

class HomeController < ApplicationController # :nodoc:
  def index
    @maps = Map.order(id: :desc).limit(20)
  end
end
