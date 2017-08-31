class FavouritesController < ApplicationController
  def create
    @favourite = current_user.favourites.new(favourite_params)
    @favourite.save
    @poll = Poll.find(params[:poll_id])

    respond_to do |format|
      format.html { redirect_to polls_path }
      format.js # render app/views/favourites/create.js.erb
    end
  end

  private

  def favourite_params
    params.require(:favourite).permit(:poll_id)
  end
end
