class Api::V1::ReviewsController < ApplicationController
  
  # GET /api/v1/reviews
  def index
    @reviews = Review.all
    render json: @reviews
  end

  # GET /api/v1/reviews/1
  def show
    @review = Review.find(params[:id])
    render json: @review
  end

  # POST /api/v1/reviews
  def create
    @review = Review.new(review_params)
    if @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  private

  # Güvenlik için 'Strong Parameters'
  def review_params
    # Gelen JSON'da bir 'review' objesi bekler ve sadece bunlara izin verir:
    params.require(:review).permit(:content, :rating, :book_id, :user_id)
  end
end