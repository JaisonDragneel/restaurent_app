class RestaurentsController < ApplicationController
  before_action :set_restaurent, only: [:show, :edit, :update, :destroy]
  # GET /restaurents
  # GET /restaurents.json
  def get_locations
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{params[:latitude]},#{params[:longitude]}&radius=500&key=#{Rails.application.secrets.google_places_key}"
    http_call = open(url).read
    response = JSON.parse(http_call, {:symbolize_names => true})
    @locations = response[:results]
  end

  def index
    @restaurents = Restaurent.all
  end

  # GET /restaurents/1
  # GET /restaurents/1.json
  def show
  end

  # GET /restaurents/new
  def new
    @restaurent = Restaurent.new
  end

  # GET /restaurents/1/edit
  def edit
  end

  # POST /restaurents
  # POST /restaurents.json
  def create
    @restaurent = Restaurent.new(restaurent_params)
    @restaurent.geocode
    if @restaurent.save
      redirect_to @restaurent, notice: 'Restaurent was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /restaurents/1
  # PATCH/PUT /restaurents/1.json
  def update
    if @restaurent.update(restaurent_params)
      redirect_to @restaurent, notice: 'Restaurent was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /restaurents/1
  # DELETE /restaurents/1.json
  def destroy
    @restaurent.destroy
    redirect_to restaurents_url, notice: 'Restaurent was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurent
      @restaurent = Restaurent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurent_params
      params.require(:restaurent).permit(:name, :address, :image, :latitude, :longitude)
    end
end
