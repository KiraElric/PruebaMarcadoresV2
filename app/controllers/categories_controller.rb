class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy api_details ]
  before_action :set_parent_category, only: %i[ new edit index ]
  
  # GET /categories or /categories.json
  def index
    @categories = Category.all
    @category = Category.new
  end

  # GET /categories/1 or /categories/1.json
  def show
    respond_to do |format|
      format.js
    end
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    sleep 1

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
        format.js
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
        format.html { redirect_to @category, notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
        format.js
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
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  def api_details
    respond_to do |format|
      format.json { render :show, status: :ok, location: @category }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    def set_parent_category
      @parent_category = Category.pluck(:name, :id)
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :parent_category)
    end
end
