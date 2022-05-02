#PRODUTOS FAVORITOS DOS USUARIOS
class ProductUser < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates_uniqueness_of :product_id, scope: :user_id
end
