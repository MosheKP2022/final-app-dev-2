class LabeledOfferingsController < ApplicationController
  before_action :set_labeled_offering, only: %i[ show edit update destroy ]

  # GET /labeled_offerings or /labeled_offerings.json
  def index
    @labeled_offerings = LabeledOffering.all
  end

  # GET /labeled_offerings/1 or /labeled_offerings/1.json
  def show
  end

  # GET /labeled_offerings/new
  def new
    @labeled_offering = LabeledOffering.new
  end

  # GET /labeled_offerings/1/edit
  def edit
  end

  # POST /labeled_offerings or /labeled_offerings.json
  def create
    @labeled_offering = LabeledOffering.new(labeled_offering_params)

    respond_to do |format|
      if @labeled_offering.save
        format.html { redirect_to labeled_offering_url(@labeled_offering), notice: "Labeled offering was successfully created." }
        format.json { render :show, status: :created, location: @labeled_offering }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @labeled_offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labeled_offerings/1 or /labeled_offerings/1.json
  def update
    respond_to do |format|
      if @labeled_offering.update(labeled_offering_params)
        format.html { redirect_to labeled_offering_url(@labeled_offering), notice: "Labeled offering was successfully updated." }
        format.json { render :show, status: :ok, location: @labeled_offering }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @labeled_offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labeled_offerings/1 or /labeled_offerings/1.json
  def destroy
    @labeled_offering.destroy

    respond_to do |format|
      format.html { redirect_to labeled_offerings_url, notice: "Labeled offering was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labeled_offering
      @labeled_offering = LabeledOffering.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def labeled_offering_params
      params.require(:labeled_offering).permit(:offering_id, :tag_id)
    end
end
