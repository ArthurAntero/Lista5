class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :authentication_token, :isadmin, :photo_url
  has_many :product_users

  def photo_url
    if object.photo.attached?
      Rails.application.routes.url_helpers.rails_blob_path(object.photo, only_path: true)
    end
  end
end
