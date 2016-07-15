class RegistersController < ApplicationController
    
    def register
        @product=Product.new
    end
    
    def buy
        @product = Product.find_by(jan_code: params[:product][:jan_code])
        @product.update({:product_stack => @product.product_stack - 1}) 
    end
    
    def product_params
      params.require(:product).permit(:jan_code)
    end
    
end
