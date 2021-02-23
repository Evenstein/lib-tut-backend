# frozen_string_literal: true

class BooksController < BaseController
  before_action :set_book, only: %i[show edit update destroy]
  helper_method :sort_column, :sort_direction

  def index
    @books = if params[:tag]
               Book.tagged_with(params[:tag])
             else
               Book.order("#{sort_column} #{sort_direction}")
             end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.validate!('/book')
    @book.save

    redirect_to books_url
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  def show; end

  def edit; end

  def update
    @book.assign_attributes(book_params)
    @book.validate!('/book')
    @book.save

    redirect_to book_url(@book)
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  def destroy
    @book.destroy

    redirect_to books_url
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def sort_column
    return nil if params[:sort] == 'tags'

    Book.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
  end

  def book_params
    params.require(:book).permit(
      :link,
      :title,
      :author,
      :description,
      :image,
      :tag,
      { tag_ids: [] }
    )
  end
end
