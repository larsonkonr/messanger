class MessagesController < ApplicationController
  before_filter :authorize!

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save!
    PrivatePub.publish_to("/conversations/#{@conversation}/new", "alert('#{@message.body}');")
    @path = conversation_path(@conversation)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
