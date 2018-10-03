class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :update, :destroy]
  before_action :set_conversation, only: [:index]


  # GET /replies
  def index
    # @replies = @conversation.replies.all
    # render json: @replies
  end

  # GET /replies/1
  def show
    # render json: @reply
  end

  # POST /replies
  def create
    @client.conversations.reply(:id => reply_params[:conversation_id], :type => 'user', 
    :intercom_user_id =>  '5bb374ecf0dd0616ebf36557', :message_type => 'comment', :body => reply_params[:body], 
    :attachment_urls =>   reply_params[:attachment_urls])

    # if @reply.save
    #   render json: @reply, status: :created, location: @reply
    # else
    #   render json: @reply.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /replies/1
  def update
    # if @reply.update(reply_params)
    #   render json: @reply
    # else
    #   render json: @reply.errors, status: :unprocessable_entity
    # end
  end

  # DELETE /replies/1
  def destroy
    # @reply.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = @client.conversations.find(id: params[:conversation_id])
    end

    def set_reply
      # @reply = Reply.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reply_params
      params.permit(:conversation_id, :body, :attachment_urls)
    end
end
