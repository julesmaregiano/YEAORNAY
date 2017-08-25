class TargetsController < ApplicationController
  def new
    @poll = Poll.find(params[:poll_id])
    if params[:search]
      @groups = current_user.groups.search(search_params)
    else
      @groups = current_user.groups
    end
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

  def search_params
    params.require(:search).permit(:search)
  end
end
