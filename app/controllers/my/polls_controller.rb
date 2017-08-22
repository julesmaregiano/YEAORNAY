class My::PollsController < ApplicationController
  def index
    @polls = current_user.polls
  end
end
