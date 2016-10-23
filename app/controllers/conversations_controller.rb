class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def show
    @conversation = Conversation.with_messages.find(params[:id])
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(conversation_params)

    if @conversation.save
      redirect_to conversation_path(@conversation),
                  notice: "Successfully created a new conversation"
    else
      render action: :new
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:title, :note, :content)
  end
end
