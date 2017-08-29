class My::PollsController < ApplicationController

  def index
    @polls = Poll.list(current_user)
    @user = current_user
    @favourites = current_user.favourites
  end

  def show
    @poll = Poll.find(params[:id])
  end

end
