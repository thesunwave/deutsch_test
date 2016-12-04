class MainPageController < ApplicationController
  include ScopieRails::Controller

  def index
  end

  def search
    @records = apply_scopes(Numberplan.search(params[:query]))
    render json: {
        data: @records,
        currentPage: @records.current_page,
        pages: @records.total_pages
    }, except: [:created_at, :updated_at, :max_length, :min_length]
  end
end
