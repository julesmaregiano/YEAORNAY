class TargetsController < ApplicationController
  def new
    @poll = Poll.find(params[:poll_id])
  end

  def create
    @poll = Poll.find(params[:poll_id])
    @poll.update(poll_params)
    redirect_to polls_path
  end

  private

  def poll_params
    params.require(:poll).permit(group_ids: [])
  end

end
