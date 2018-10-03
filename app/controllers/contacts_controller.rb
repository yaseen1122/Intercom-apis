class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  def index
    @contacts = @client.contacts.all
    render json: @contacts
  end

  # GET /contacts/1
  def show
    render json: @contact

  end

  # POST /contacts
  def create
    @contact = @client.contacts.create(contact_params)
    
    # if @contact.present?
    #   render json: @contact, status: :created, location: @contact
    # else
    #   render json: @contact.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /contacts/1
  def update
    @contact.name  = params[:name]  if params[:name].present?
    @contact.email = params[:email] if params[:email].present?
    @contact.phone = params[:phone] if params[:phone].present?

    if @client.contacts.save(@contact)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @client.contacts.delete(@contact)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = @client.contacts.find(:id => params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.permit(:name,:email, :phone)
    end
end
