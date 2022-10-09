class ReceiversController < ApplicationController
  RECEIVERS_PER_PAGE = 10
  before_action :set_receiver, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /receivers or /receivers.json
  def index
    @page = params.fetch(:page, 1).to_i
    @page = 1 if @page == 0
   # Get the total number of receivers
   count = Receiver.all.count

   # Get the number of pages
   @pages = ( count / RECEIVERS_PER_PAGE)
   @pages = @pages + 1 if RECEIVERS_PER_PAGE > count 
   @receivers = Receiver.offset((@page-1)*RECEIVERS_PER_PAGE).limit(RECEIVERS_PER_PAGE)
  end

  # GET /receivers/1 or /receivers/1.json
  def show
  end

  # GET /receivers/new
  def new
    @receiver = Receiver.new
  end

  # GET /receivers/1/edit
  def edit
  end

  # POST /receivers or /receivers.json
  def create
    @receiver = Receiver.new(receiver_params)

    respond_to do |format|
      if @receiver.save
        format.html { redirect_to receiver_url(@receiver), notice: "Receptor foi criado com sucesso." }
        format.json { render :show, status: :created, location: @receiver }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receivers/1 or /receivers/1.json
  def update
    respond_to do |format|
      if @receiver.update(receiver_params)
        
        format.html { redirect_to receiver_url(@receiver), notice: "Receptor foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @receiver }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receivers/1 or /receivers/1.json
  def destroy
    @receiver.destroy

    respond_to do |format|
      format.html { redirect_to receivers_url, notice: "Receptor foi deletado com sucesso" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receiver
      @receiver = Receiver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receiver_params
      params.require(:receiver).permit(:name, :email, :condition, :truly_linfo, :cep, :state, :city, :street, :number, :complement, :approved, :link)
    end
end
