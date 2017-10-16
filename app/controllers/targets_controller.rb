class TargetsController < ApplicationController
  def new
    @poll = Poll.find(params[:poll_id])

    if params.dig(:search, :search).blank?
      @groups = current_user.groups
      # Rajouter ".not_alone.by_yayers" pour enlever les groupes vides
    else
      groups = current_user.groups.search_by_name(search_params["search"])
      # Rajouter ".not_alone" devant search_by_name pour enlever les groupes vides
      @groups = groups.by_yayers
    end
    respond_to do |format|
      format.html { render :new }
      format.js # render app/views/targets/new.js.erb
    end
  end

  def create
    @poll = Poll.find(params[:poll_id])
    @poll.update(poll_params)
    redirect_to polls_path, notice: "Ton YAY a bien été créé !"
  end

  private

  def poll_params
    params.require(:poll).permit(group_ids: [])
  end

  def search_params
    params.require(:search).permit(:search)
  end
end
