# frozen_string_literal: true

class MapsController < ApplicationController # :nodoc:
  def show
    @map = Map.find(params[:id])
  end
end
