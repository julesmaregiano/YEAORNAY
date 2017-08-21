class PollsController < ApplicationController
  def new
    @poll = Poll.new
  end

  def create
    @poll = current_user.polls.build(poll_params)
    return render :new unless params[:extraparam] == 0
    if @poll.save
      redirect_to "answers/new"
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
    params.require(:poll).permit(:context, :ends_at, :anonym, :photo, :extraparam)
  end
end
