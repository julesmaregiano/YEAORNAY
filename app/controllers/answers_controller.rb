class AnswersController < ApplicationController
  def new
    @poll = first_available_poll
    @answer = Answer.new
    @user = current_user
    @polls = Poll.all
  end

  def create
  end

  private

  def first_available_poll(user)
    # Si le poll dont on est en train de parler
    @polls.each do |poll|
    # n a pas encore de réponse de l'utilisateur
    poll.
    # et que le poll est encore dans les temps
    # return ce poll

  end
end
