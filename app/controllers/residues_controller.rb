class ResiduesController < ApplicationController
  before_action :set_residue, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  RESIDUES_PER_PAGE = 1
  # GET /residues or /residues.json
  def index
    @page = params.fetch(:page, 1).to_i
    @page = 1 if @page == 0
    # Get the total number of residues
    count = Residue.all.count

    # Get the number of pages
    @pages = ( count / RESIDUES_PER_PAGE)
    @pages = @pages + 1 if RESIDUES_PER_PAGE > count 
    @residues = Residue.offset((@page-1)*RESIDUES_PER_PAGE).limit(RESIDUES_PER_PAGE)
  end

  # GET /residues/1 or /residues/1.json
  def show
  end

  # GET /residues/new
  def new
    @residue = Residue.new
  end

  # GET /residues/1/edit
  def edit
  end

  # POST /residues or /residues.json
  def create
    @residue = Residue.new(residue_params)

    respond_to do |format|
      if @residue.save
        format.html { redirect_to residue_url(@residue), notice: "Residue was successfully created." }
        format.json { render :show, status: :created, location: @residue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @residue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /residues/1 or /residues/1.json
  def update
    respond_to do |format|
      if @residue.update(residue_params)
        format.html { redirect_to residue_url(@residue), notice: "Residue was successfully updated." }
        format.json { render :show, status: :ok, location: @residue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @residue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /residues/1 or /residues/1.json
  def destroy
    @residue.destroy

    respond_to do |format|
      format.html { redirect_to residues_url, notice: "Residue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_residue
      @residue = Residue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def residue_params
      params.require(:residue).permit(:title, :subtitle, :content, :description, :link, :buttonContent, :slug, :image)
    end
end
