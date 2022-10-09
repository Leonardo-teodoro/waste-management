class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  CATEGORIES_PER_PAGE = 5
  # GET /categories or /categories.json
  def index
    @page = params.fetch(:page, 1).to_i
    @page = 1 if @page == 0
    # Get the total number of residues
    count = Category.all.count

    # Get the number of pages
    @pages = ( count / CATEGORIES_PER_PAGE)
    @pages = @pages + 1 if CATEGORIES_PER_PAGE > count 
    @categories = Category.offset((@page-1)*CATEGORIES_PER_PAGE).limit(CATEGORIES_PER_PAGE)
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: "Categoria criada com sucesso." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path, notice: "Categoria atualizada com sucesso" }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Categoria deletada com sucesso." }
      format.json { head :no_content }
    end
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
end
