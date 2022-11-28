class PostSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :opening_id, :common_position_id, :image, :created_at, :updated_at
end
