class ProductsController < ApplicationController
  def show
    @product = Zappos.product(params[:id])
  end

end
