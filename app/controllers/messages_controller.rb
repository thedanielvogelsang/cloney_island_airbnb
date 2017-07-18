class MessagesController < ApplicationController
  before_action :get_messages

  def create
    message = current_user.messages.build(message_params)
    if message.save
    else
      redirect_to conversations_path
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :conversation_id)
    end

    def get_messages
      @messages = Message.for_display
      @message = current_user.messages.build
    end
end