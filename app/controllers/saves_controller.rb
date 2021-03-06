class SavesController < ApplicationController
  before_action :set_save, only: %i[ show edit update destroy ]

  # GET /saves or /saves.json
  def index
    @saves = Save.all
  end

  # GET /saves/1 or /saves/1.json
  def show
  end

  # GET /saves/new
  def new
    @save = Save.new
  end

  # GET /saves/1/edit
  def edit
  end

  # POST /saves or /saves.json
  def create
    @save = Save.new(save_params)

    respond_to do |format|
      if @save.save
        format.html { redirect_back fallback_location: save_url(@save), notice: "Save was successfully created." }
        format.json { render :show, status: :created, location: @save }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @save.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saves/1 or /saves/1.json
  def update
    respond_to do |format|
      if @save.update(save_params)
        format.html { redirect_back fallback_location: save_url(@save), notice: "Save was successfully updated." }
        format.json { render :show, status: :ok, location: @save }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @save.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saves/1 or /saves/1.json
  def destroy
    @save.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: "Save was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_save
      @save = Save.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def save_params
      params.require(:save).permit(:offering_id, :user_id)
    end
end
