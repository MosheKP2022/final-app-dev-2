class OfferingsController < ApplicationController
  before_action :set_offering, only: %i[ show edit update destroy ]

  # GET /offerings or /offerings.json
  def index
    @offerings = Offering.all
  end

  # GET /offerings/1 or /offerings/1.json
  def show
  end

  # GET /offerings/new
  def new
    @offering = Offering.new
  end

  # GET /offerings/1/edit
  def edit
  end

  # POST /offerings or /offerings.json
  def create
    @offering = Offering.new(offering_params)
    @offering.seller = current_user
    @offering.status = "available"
  
    
    # if new_labeled_offering.valid?
    #   new_labeled_offering.save
    # else
 
    respond_to do |format|
      if @offering.save
        format.html { redirect_to offering_url(@offering), notice: "Offering was successfully created." }
        format.json { render :show, status: :created, location: @offering }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
    # @offering.tags << params.fetch("tag")
      new_labeled_offering = LabeledOffering.create(
        tag_id: params.fetch("tag"),
        offering_id: @offering.id
      )
      if new_labeled_offering.valid?
        new_labeled_offering.save
        p new_labeled_offering.errors.full_messages
      end
  end


  # PATCH/PUT /offerings/1 or /offerings/1.json
  def update
    respond_to do |format|
      if @offering.update(offering_params)
        format.html { redirect_to offering_url(@offering), notice: "Offering was successfully updated." }
        format.json { render :show, status: :ok, location: @offering }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offerings/1 or /offerings/1.json
  def destroy
    @offering.destroy

    respond_to do |format|
      format.html { redirect_to offerings_url, notice: "Offering was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offering
      @offering = Offering.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offering_params
      params.require(:offering).permit(:title, :description, :image, :min_age, :max_age, :address, :price, :date, :time, :video, :status, :seller_id, :comments_count, :labeled_offerings_count, :saves_count)
    end

    
    # def number_to_currency(price)
    #   number_to_currency(price)
    # end

end
