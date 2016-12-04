class MainPageController < ApplicationController
  def index
    @records = Numberplan.first(200)
  end
end
