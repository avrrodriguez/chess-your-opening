class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :opening
  belongs_to :common_position

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
