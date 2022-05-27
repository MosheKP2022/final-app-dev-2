class ContactUsMessagesController < ApplicationController
  before_action :set_contact_us_message, only: %i[ show edit update destroy ]

  # GET /contact_us_messages or /contact_us_messages.json
  def index
    @contact_us_messages = ContactUsMessage.all
  end

  # GET /contact_us_messages/1 or /contact_us_messages/1.json
  def show
  end

  # GET /contact_us_messages/new
  def new
    @contact_us_message = ContactUsMessage.new
  end

  # GET /contact_us_messages/1/edit
  def edit
  end

  # POST /contact_us_messages or /contact_us_messages.json
  def create
    @contact_us_message = ContactUsMessage.new(contact_us_message_params)

    respond_to do |format|
      if @contact_us_message.save
        format.html { redirect_to contact_us_message_url(@contact_us_message), notice: "Contact us message was successfully created." }
        format.json { render :show, status: :created, location: @contact_us_message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact_us_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_us_messages/1 or /contact_us_messages/1.json
  def update
    respond_to do |format|
      if @contact_us_message.update(contact_us_message_params)
        format.html { redirect_to contact_us_message_url(@contact_us_message), notice: "Contact us message was successfully updated." }
        format.json { render :show, status: :ok, location: @contact_us_message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact_us_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_us_messages/1 or /contact_us_messages/1.json
  def destroy
    @contact_us_message.destroy

    respond_to do |format|
      format.html { redirect_to contact_us_messages_url, notice: "Contact us message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_us_message
      @contact_us_message = ContactUsMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_us_message_params
      params.require(:contact_us_message).permit(:title, :body, :user_id)
    end
end
