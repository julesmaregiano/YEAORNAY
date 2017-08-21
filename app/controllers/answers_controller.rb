class AnswersController < ApplicationController
  def new
    @polls = Poll.all
    @answer = Answer.create
  end

end
