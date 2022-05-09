class ReviewsController < ApplicationController
  def index
    # list page for reviews
    @reviews = Review.all
  end

  def new
    # form for new review
    @review = Review.new
  end

  def create
    # create new review in database
    @review = Review.new(params.require(:review).permit(:game, :description, :score, :url, :blockchain))

    # save to database
    if @review.save
      redirect_to root_path
      flash[:notice] = "Your Review was Created Successfully!"
    else
      flash[:alert] = "Your Review was NOT Created Successfully! Description must be at least 20 characters long. Score must be between 1 and 10."
      render "new"
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    # delete review from database
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(params.require(:review).permit(:game, :description, :score, :url, :blockchain))

    # save to database
    if @review.save
      redirect_to review_path(@review)
      flash[:notice] = "Your Review was Edited Successfully!"
    else
      flash[:alert] = "Your Review was NOT Edited Successfully!"
    end
  end
end
