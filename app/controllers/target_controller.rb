class TargetsController < ApplicationController
  def new
    @belongings = current_user.belongings
    @target = Target.new
  end

  def create

  end

  private

  def _params
    params.require(:target).permit(:group_id) # faut - il le user_id ?
  end

end
