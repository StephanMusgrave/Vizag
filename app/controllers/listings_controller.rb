class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  # GET /listings
  # GET /listings.json
  def index
    if params[:category].blank?
      @all_listings = Listing.all
    else
      @category_id = Category.find_by(name_english: params[:category]).id
      @all_listings = Listing.where(category_id: @category_id)
    end
    @listings_per_page = @all_listings.paginate(page: params[:page], per_page: 12)
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    @listing.image_containers.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save
        if params[:pictures]
          params[:pictures].each { |picture|
          @listing.image_containers.create(picture: picture)
          }
        end
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        if params[:pictures]
          params[:pictures].each { |picture|
          @listing.image_containers.create(picture: picture)
          }
        end
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name_english,
        :name_spanish,
        :description_english,
        :description_spanish,
        :size_english,
        :size_spanish,
        :weight,
        :image,
        :price_euro,
        :price_dollar,
        :price_gbp,
        :category_id,
        :image_containers_attributes => [:picture, :original_filename, :content_type, :headers]
        )
    end
end
