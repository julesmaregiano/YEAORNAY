class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @poll = Poll.find(params[:poll_id])
    @message.poll = @poll
    @message.user = current_user
    if @message.save
      ActionCable.server.broadcast("poll_#{@poll.id}", {
          message_partial: render(partial: "messages/message", locals: { message: @message, user_is_messages_author: false})
        })
      respond_to do |format|
        format.html {redirect_to poll_path(@poll)}
        format.js
      end
    else
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
