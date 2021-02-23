# frozen_string_literal: true

class BooksController < API::ApplicationController
  PER_PAGE = 10

  def index
    @books = Book.order('created_at DESC')
                 .page(params[:page])
                 .per(PER_PAGE)
    render json: Serializers::Book.render(
      @books,
      root: :books,
      meta: { count: Book.all.count }
    )
  end

  def show
    @book = Book.find(params[:id])

    render json: Serializers::Book.render(@book, root: :book)
  end

  def search
    item = params[:item]
    @q = Book.ransack(title_or_author_i_cont: item)
    @books = @q.result.order('created_at DESC')
    render json: Serializers::Book.render(
      @books,
      root: :books,
      meta: { count: @books.count }
    )
  end
end
