class PollsController < ApplicationController
  def index
    @polls = Poll.answerable(current_user)
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = current_user.polls.build(poll_params)
    @poll.ends_at = Time.now + 86400
    if @poll.photo.nil?
      render :new
    else
      if @poll.save
        redirect_to new_poll_target_path(@poll)
      else
        render :new
      end
    end
  end

  def destroy
    @poll.destroy
    redirect_to "users/show" # mettre un ajax
  end

  private

  def poll_params
    params.require(:poll).permit(:context, :ends_at, :anonym, :photo, :context_y)
  end
end
