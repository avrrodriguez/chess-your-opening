class PostSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :opening_id, :image, :image_url, :created_at, :updated_at
end
