class PollsController < ApplicationController
  def index
    @polls = Poll.answerable(current_user)
  end

  def new
    @poll = Poll.new
  end

  def show
    @poll = Poll.find(params[:id])
  end

  def create
    @poll = current_user.polls.build(poll_params)
    @poll.ends_at = Time.now + 7200
    if @poll.save
      redirect_to polls_path
    else
      render :new
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
