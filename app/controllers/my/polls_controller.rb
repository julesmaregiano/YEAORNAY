class My::PollsController < ApplicationController

  def index
    @polls = Poll.list(current_user)
    @user = current_user
  end

end
