# frozen_string_literal: true

class API::TagsController < API::ApplicationController
  def index
    tags = Tag.all

    render json: Serializers::Tag.render(tags)
  end

  def search
    genres = genres_params.reject { |_genre, available| !available }
    result = if genres.any?
               Book.fetch_by_tag_name(genres).distinct.order('created_at DESC')
             else
               Book.order('created_at DESC')
             end

    render json: Serializers::Book.render(
        result,
        root: :books,
        meta: { count: result.count }
    )
  end

  private

  def genres_params
    params.require(:genres).permit!.to_h
  end
end
