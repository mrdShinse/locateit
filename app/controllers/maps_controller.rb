# frozen_string_literal: true

class MapsController < ApplicationController # :nodoc:
  before_action :set_map, only: %i[show edit update destroy]

  # GET /maps
  def index
    @maps = Map.all
  end

  # GET /maps/1
  def show; end

  # GET /maps/new
  def new
    @map = Map.new
  end

  # GET /maps/1/edit
  def edit; end

  # POST /maps
  def create
    @map = current_user.maps.build(map_params)

    if @map.save
      redirect_to @map, notice: 'Map was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /maps/1
  def update
    if @map.update(map_params)
      redirect_to @map, notice: 'Map was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /maps/1
  def destroy
    @map.destroy
    redirect_to maps_url, notice: 'Map was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_map
    @map = Map.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def map_params
    params.require(:map).permit(:user_id, :name, :memo)
  end
end
