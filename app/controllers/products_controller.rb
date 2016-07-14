class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:index,:lunch,:drink,:bread,:noodle,:create]
  def index
    @products = Product.all
  end
  
  def lunch
    @products = Product.all
  end
  
  def bread
    @products = Product.all
  end
  
  def noodle
    @products = Product.all
  end
  
  def drink
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new
    @product.jan_code = params[:product][:jan_code]
    @product.product_name = params[:product][:product_name]
    @product.product_stack = params[:product][:product_stack]
    @product.product_cost = params[:product][:product_cost]
    @product.product_type = params[:product][:product_type]
    @product.save
    redirect_to products_path
  end
  
  def buy
    logger.debug('test')
    @product=Product.new
  end

  def update
    logger.debug('test2')
    @product = Product.find_by(:jan_code => params[:jan_code])
    @product.update({:product_stack => @product.product_stack - 1})
    redirect_to 'products/buy'
  end
  
  def is_drink?
    p.product_type==drink
  end
  
  def product_params
      params.require(:product).permit(:jan_code,:product_name, :product_stack, :product_cost, :product_type)
  end
  
end

