class DiscardsController < ApplicationController
  before_action :set_discard, only: %i[ show edit update destroy ]

  # GET /discards or /discards.json
  def index
    @discards = Discard.all
  end

  # GET /discards/1 or /discards/1.json
  def show
  end

  # GET /discards/new
  def new
    @discard = Discard.new
  end

  # GET /discards/1/edit
  def edit
  end

  # POST /discards or /discards.json
  def create
    @discard = Discard.new(discard_params)

    respond_to do |format|
      if @discard.save
        format.html { redirect_to discard_url(@discard), notice: "Discard was successfully created." }
        format.json { render :show, status: :created, location: @discard }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @discard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discards/1 or /discards/1.json
  def update
    respond_to do |format|
      if @discard.update(discard_params)
        format.html { redirect_to discard_url(@discard), notice: "Discard was successfully updated." }
        format.json { render :show, status: :ok, location: @discard }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @discard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discards/1 or /discards/1.json
  def destroy
    @discard.destroy

    respond_to do |format|
      format.html { redirect_to discards_url, notice: "Discard was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discard
      @discard = Discard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def discard_params
      params.require(:discard).permit(:description, :date)
    end
end
