class PollsController < ApplicationController
  def index
    @polls = Poll.answerable(current_user)
  end

  def create
    @polls = Poll.all
  end

end
