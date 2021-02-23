# frozen_string_literal: true

class ReviewsController < API::ApplicationController
  before_action :authenticate_user

  def fetch_review
    book = Book.find(params[:book_id])
    review = Review.find_or_create_by(user: current_user, book: book)

    review.update(text: params[:text], rate: params[:rate])
    render json: Serializers::Book.render(book)
  end

  def search_review
    book = Book.find(params[:book_id])
    review = Review.find_by(user: current_user, book: book)

    if review
      render json: Serializers::Review.render(review)
    else
      render json: {}
    end
  end
end
