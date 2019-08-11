class Api::V1::MessagesController < ApplicationController
    skip_before_action :authorize, only: [:create, :index, :show]

        def create
          message = Message.new(message_params)
          chat = Chat.find(message_params[:chat_id])
          if message.save
            serialized_data = ActiveModelSerializers::Adapter::Json.new(
              MessageSerializer.new(message)
            ).serializable_hash
            MessagesChannel.broadcast_to chat, serialized_data
            head :ok
          end
        end

        def index
            messages = Message.all
            render json: messages
        end
        
        private
        
        def message_params
          params.require(:message).permit(:content, :chat_id, :user_id)
        end
end
