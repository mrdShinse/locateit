# frozen_string_literal: true

module Me
  module Maps
    class PinsController < ApplicationController # :nodoc:
      before_action -> { @user = current_user }
      before_action -> { @map = current_user.maps.find(params[:map_id]) }
      before_action :set_pin, only: %i[edit update destroy]

      def new
        @pin = @map.pins.build
      end

      def edit; end

      def create
        @pin = @map.pins.build(pin_params)

        if @pin.save
          redirect_to edit_me_map_pin_path(id: @pin), notice: 'Pin was successfully created.'
        else
          render :new
        end
      end

      def update
        if @pin.update(pin_params)
          redirect_to edit_me_map_pin_path(id: @pin), notice: 'Pin was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @pin.destroy
        redirect_to me_map_path(id: @map), notice: 'Pin was successfully destroyed.'
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_pin
        @pin = @map.pins.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def pin_params
        params.require(:pin).permit(:name, :memo, :priority, :lat, :lng)
      end
    end
  end
end
