class DetailsController < ApplicationController
  def index
    @products = Product.all
  end
end
