class ProductUserSerializer < ActiveModel::Serializer
  attributes :product_id
  has_many :products 
end
