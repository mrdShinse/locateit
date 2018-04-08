# frozen_string_literal: true

module Me
  class MapsController < ApplicationController # :nodoc:
    before_action -> { @user = current_user }
    before_action -> { @map = @user.maps.find(params[:id]) }, only: %i[show edit update destroy]

    def index
      @maps = @user.maps
    end

    def show; end

    def new
      @map = @user.maps.build
    end

    def edit; end

    def create
      @map = @user.maps.build(map_params)

      if @map.save
        redirect_to me_map_path(id: @map), notice: 'Map was successfully created.'
      else
        render :new
      end
    end

    def update
      if @map.update(map_params)
        redirect_to me_map_path, notice: 'Map was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @map.destroy
      redirect_to me_maps_url, notice: 'Map was successfully destroyed.'
    end

    private

    def map_params
      params.require(:map).permit(:name, :memo)
    end
  end
end
