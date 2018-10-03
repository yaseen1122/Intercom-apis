class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :update, :destroy]
  before_action :set_user_conversations, only: [:index, :destroy]

  # GET /conversations
  def index
    render json: @conversations
  end

  # GET /conversations/1
  def show
    render json: @conversation   
  end 

  # POST /conversations
  def create

    @conversation = @client.messages.create(:from => {
                                            :type => "user",
                                            :id => "5bb374ecf0dd0616ebf36557"  # replace this id with current_user id. Defined id is hardcoded specific user id 
                                            },
                                            :body => conversation_params[:body]
                                            )

    # if @conversation.save
    #   render json: @conversation, status: :created, location: @conversation
    # else
    #   render json: @conversation.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /conversations/1
  def update
    # if @conversation.update(conversation_params)
    #   render json: @conversation
    # else
    #   render json: @conversation.errors, status: :unprocessable_entity
    # end
  end

  # DELETE /conversations/1
  def destroy
    # @conversations.destroy(@conversation)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = @client.conversations.find(id: params[:id])
    end

    def set_user_conversations
      # replace this intercom_user_id with current_user id. Defined id is hardcoded specific user id 
      @conversations = @client.conversations.find_all(intercom_user_id: '5bb374ecf0dd0616ebf36557', type: 'user')
    end


    # Only allow a trusted parameter "white list" through.
    def conversation_params
      params.permit(:body)
    end
end
