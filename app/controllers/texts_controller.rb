class TextsController < ApplicationController
  # GET /texts or /texts.json
  def index
    if params[:query].present?
      @texts = Text.search(params[:query], fields: [:prompt], match: :word_start, limit: 15)
    else
      @texts = Text.none
    end

    if turbo_frame_request?
      render partial: 'texts', locals: { texts: @texts }
    else
      render :index
    end
  end
end
