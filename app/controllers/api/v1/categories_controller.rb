class Api::V1::CategoriesController < ApplicationController
    acts_as_token_authentication_handler_for User
    before_action :require_login, :admin_permission, only: %i[create update delete]
    def index
       categories =  Category.all
       render json: categories, status: :ok
    end

    def show
        category = Category.find(params[:id])
        render json: category, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create
        category = Category.new(categories_params)
        category.save!
        render json: category, status: :created
    rescue StandardError
        head(:bad_request)
    end

    def update
        category = Category.find(params[:id])
        category.update!(categories_params)
        render json: category, status: :ok
    rescue StandardError
        head(:unprocessable_entity)
    end

    def delete
        category = Category.find(params[:id])
        category.destroy!
        render json: { message: "Categoria #{category.name} deletada com sucesso"}, status: :ok
    rescue StandardError
        head(bad_request)
    end

    private 
    def categories_params
        params.require(:category).permit(:name)
    end
end