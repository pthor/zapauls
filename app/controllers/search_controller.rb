class SearchController < ApplicationController
  def index
    params[:search] ||= "snowboard" 
    @results = Zappos.search(params[:search], params[:page])
  end

  def show
  end

end
