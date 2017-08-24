class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @user = current_user
  end

  def create
    @answer = current_user.answers.new(answer_params)
    if @answer.save!
      redirect_to polls_path
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:value, :user_id, :poll_id)
  end
end
