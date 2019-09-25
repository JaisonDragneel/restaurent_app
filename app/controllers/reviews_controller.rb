class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all

  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.restaurent_id = @@resid
    @review.status = true
    check = checking
    if check == 0
      flash[:notice] = "You have already reviewed this website once, either edit or delete your previous review"
      redirect_to restaurents_path
    else
      if @review.save && check
        redirect_to @review, notice: 'Review was successfully created.'
      else
          render :new
      end
    end
    # @review.restaurent_id = @restaurent.id
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Restaurent was successfully destroyed.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:review, :ratings, :status, :restaurent_id)
    end

    def checking
      check = current_user.reviews.pluck(:restaurent_id)
      check.each do |restid|
        p restid
        p @@resid
        if restid == @review.restaurent_id
            return 0
        end
      end
      return 1
    end
end
