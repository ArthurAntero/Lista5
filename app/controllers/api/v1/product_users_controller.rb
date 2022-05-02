class Api::V1::ProductUsersController < ApplicationController
    acts_as_token_authentication_handler_for User
    before_action :require_login, :admin_permission, only: %i[create delete]
    def create
        product_user = ProductUser.new(product_users_params)
        product_user.save!
        render json: product_user, status: :created
    rescue StandardError
        head(:bad_request)
    end

    def delete
        product_user = ProductUser.find(params[:id])
        product_user.destroy!
        render json: { message: "Produto favorito deletado com sucesso"}, status: :ok
    rescue StandardError
        head(:bad_request)
    end

    private
    def product_users_params
        params.require(:product_user).permit(:user_id, :product_id)
    end
end
