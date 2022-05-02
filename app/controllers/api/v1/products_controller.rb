class Api::V1::ProductsController < ApplicationController
    acts_as_token_authentication_handler_for User
    before_action :require_login, :admin_permission, only: %i[create update delete]
    def index
        products =  Product.all
        render json: products, status: :ok
    end
 
    def show
         product = Product.find(params[:id])
         render json: product, status: :ok
    rescue StandardError
         head(:not_found)
    end
    
    def create
        product = Product.new(products_params)
        product.save!
        render json: product, status: :created
    rescue StandardError
        head(:bad_request)
    end

    def update
        product = Product.find(params[:id])
        product.update!(products_params)
        render json: product, status: :ok
    rescue StandardError
        head(:unprocessable_entity)
    end

    def delete
        product = Product.find(params[:id])
        product.destroy!
        render json: { message: "Produto #{product.name} deletado com sucesso"}, status: :ok
    rescue StandardError
        head(bad_request)
    end

    private
    def products_params
        params.require(:product).permit(:name, :description, :price, :category_id)
    end
end
