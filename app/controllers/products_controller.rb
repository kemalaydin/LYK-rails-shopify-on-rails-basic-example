class ProductsController < ApplicationController

    before_action :find_product, only: [:show, :edit, :update]
    before_action :set_locale
    #% form yapımdan dolayı authenticity_token birden fazla basıylıyor. önüne geçmek için
    #% skip_before_action :verify_authenticity_token tanımlayarak kaçmasını sağlıyoruz.
    skip_before_action :verify_authenticity_token, only: [:gift_send]

 
    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

    def index
        @products = Product.all
    end

    def show
    end

    def new
        @product = Product.new
        @product.variants.build

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
        unless(@variant.stock.positive?)
            # TODO: with %w() 
            flash[:message] = ['status' => 'danger','message' => 'Tshirt stock not aviable']
            redirect_to product_path(@product)
        else
            #* refactor edildi, böylece direkt model üzerinden ulaşarak -1 yapabiliyoruz.
            @variant.send_gift(params[:email])
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
        #% image değişkeni de eklenerek upload sistemi dahil edildi.
        params.require(:product).permit(:name,:price,:description, :image, variants_attributes: [:id,:name,:stock])
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
