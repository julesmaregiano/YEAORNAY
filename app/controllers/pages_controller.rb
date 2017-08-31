class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      redirect_to polls_path
    else
      redirect_to new_user_session_url
    end
  end

  def fake_answers
  end

  def send_fake_answer

    Poll.all.each do |poll|
      ActionCable.server.broadcast("poll_#{poll.id}", {
        status: [0, 1].sample,
        poll_id: poll.id
      })
    end
    redirect_to fake_answers_path
  end
end
