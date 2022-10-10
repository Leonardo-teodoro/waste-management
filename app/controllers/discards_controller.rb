class DiscardsController < ApplicationController
  before_action :set_discard, only: %i[ show edit update destroy ]

  before_action :authenticate_user!
  # GET /discards or /discards.json
  def index
    @discards = Discard.page params[:page]
  end

  # GET /discards/1 or /discards/1.json
  def show
  end

  # GET /discards/new
  def new
    unless Receiver.any?
      redirect_to discards_path, alert: "É necessário cadastrar receptores primeiramente." 
    end
    @discard = Discard.new
  end

  # GET /discards/1/edit
  def edit
  end

  # POST /discards or /discards.json
  def create
    @discard = Discard.new(discard_params)
    @discard.user = current_user

    set_residue
    respond_to do |format|
      if @discard.save
        format.html { redirect_to discards_path, notice: "Descarte criado com sucesso." }
        format.json { render :index, status: :created, location: @discard }
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
    
    def set_residue
      @discard.residue_id = Receiver.find(@discard.receiver_id).residue_id
    end

    # Only allow a list of trusted parameters through.
    def discard_params
      params.require(:discard).permit(:description, :date, :receiver_id)
    end
end
