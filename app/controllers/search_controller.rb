class SearchController < ApplicationController
  def index
    params[:search] ||= "snowboard" 
    @results = Zappos.search(params[:search])
  end

  def show
  end

end
