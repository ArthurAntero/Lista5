class Product < ApplicationRecord
  has_many :product_users, dependent: :destroy
  belongs_to :category
  validates :name, :description, :price, presence: true
end
