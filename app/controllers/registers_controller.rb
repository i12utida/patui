class RegistersController < ApplicationController
    
    def register
        @product=Product.new
    end
    
    def buy
        @product = Product.find_by(jan_code: params[:product][:jan_code])
        if(@product.product_stack!=0)
            @product.update({:product_stack => @product.product_stack - 1}) 
            flash[:success] = "購入しました"
            redirect_to "/registers"
        else 
            flash[:danger] = "在庫がありません。"
            redirect_to "/registers"
        end
    end
    
    def product_params
      params.require(:product).permit(:jan_code)
    end
    
end
