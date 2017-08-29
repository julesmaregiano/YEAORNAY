class FavouritesController < ApplicationController
  def create
    @favourite = current_user.favourites.new(favourite_params)
    @favourite.save
  end

  private

  def favourite_params
    params.require(:favourite).permit(:poll_id)
  end
end
