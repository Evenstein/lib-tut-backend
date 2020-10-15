# frozen_string_literal: true

class TagsController < BaseController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)

    redirect_to books_url
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end