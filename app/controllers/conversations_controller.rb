class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    @listing ||= AirbnbService.find_listing(params[:format]) || Listing.find(params[:format])
    @message = Message.new
  end

  def create
    @conversation = Conversation.new(trip_id: params[:trip_id])
    if @conversation.save
      redirect_to conversation_path(@conversation)
    end
  end

  def index
    @listin
    @conversations = current_user.conversations.uniq
  end
end
