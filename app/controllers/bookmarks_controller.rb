class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ show edit update destroy ]
  before_action :set_categories, :set_types, only: %i[ new edit index ]

  # GET /bookmarks or /bookmarks.json
  def index
    @bookmarks = Bookmark.all
    @bookmark = Bookmark.new
    @bookmark_group = Bookmark.group(:type_id).count.transform_keys {|key| Type.find(key).name}
  end

  # GET /bookmarks/1 or /bookmarks/1.json
  def show
    respond_to do |format|
      format.js
    end
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /bookmarks or /bookmarks.json
  def create
    @bookmark = Bookmark.new(bookmark_params)

    sleep 1
    
    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @bookmark, notice: "Bookmark was successfully created." }
        format.json { render :show, status: :created, location: @bookmark }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarks/1 or /bookmarks/1.json
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to @bookmark, notice: "Bookmark was successfully updated." }
        format.json { render :show, status: :ok, location: @bookmark }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1 or /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: "Bookmark was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def set_types
      @types = Type.pluck(:name, :id)
    end

    def set_categories
      @categories = Category.pluck(:name, :id)
    end

    # Only allow a list of trusted parameters through.
    def bookmark_params
      params.require(:bookmark).permit(:name, :url, :category_id, :type_id)
    end
end
