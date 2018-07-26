class ProductsController < ApplicationController

    before_action :find_product, only: [:show, :edit, :update]

    def index
        @products = Product.all
    end

    def show
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if(@product.save)
            redirect_to product_path(@product)
            flash[:message] = ["status" => "success", "message" => "New Product Create Successfull"]
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if(@product.update(product_params))
            flash[:message] = ["status" => "info", "message" => "Product updated"]
            redirect_to product_path(@product)
        else
            render 'edit'
        end
    end
    
    def gift_send
        @product = Product.find(params[:product_id])
        @variant = @product.variants.find(params[:id])
        if(@variant.stock < 1)
            flash[:message] = ['status' => 'danger','message' => 'Tshirt stock not aviable']
            redirect_to product_path(@product)
        else
            @variant.update(stock: update_stock(@variant,1))
            flash[:message] = ["status" => "success", "message" => "The product will be sent to your friend"]
            redirect_to product_path(@product)
        end
        
    end

    def destroy
        @product = Product.find(params[:id]).destroy
        flash[:message] = ["status" => "info", "message" => "Product deleted"]
        redirect_to products_path()
    end


    private
    def product_params
        params.require(:product).permit(:name,:price,:description)
    end

    private 
    def update_stock (data,decrease_stock)
        data.stock - decrease_stock
    end

    private 
    def find_product
        @product = Product.includes(:variants).find(params[:id])
    end

end
