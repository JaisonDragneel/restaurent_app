class RestaurentsController < ApplicationController
  before_action :set_restaurent, only: [:show, :edit, :update, :destroy]


  def index
    @restaurents = Restaurent.all
  end

  def show
  end

  def new
    @restaurent = Restaurent.new
  end

  def edit
  end

  def create
    @restaurent = Restaurent.new(restaurent_params)
    if @restaurent.save
      redirect_to @restaurent, notice: 'Restaurent was successfully created.'
    else
      render :new
    end
  end

  def update
    if @restaurent.update(restaurent_params)
      redirect_to @restaurent, notice: 'Restaurent was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @restaurent.destroy
    redirect_to restaurents_url, notice: 'Restaurent was successfully destroyed.'
  end

  private
    def set_restaurent
      @restaurent = Restaurent.find(params[:id])
    end

    def restaurent_params
      params.require(:restaurent).permit(:name, :address, :image, :latitude, :longitude)
    end
end
