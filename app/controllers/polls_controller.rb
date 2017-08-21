class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def create
    @polls = Poll.all
  end

  def destroy
  end


end
