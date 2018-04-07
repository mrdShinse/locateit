# frozen_string_literal: true

class MeController < ApplicationController # :nodoc:
  def show; end

  def edit; end

  def update
    current_user.update(user_params)
    redirect_to me_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
