class MainPageController < ApplicationController
  def index
  end

  def search
    @records = Numberplan.search(params[:query])
    render json: @records, except: [:created_at, :updated_at, :max_length, :min_length]
  end
end
