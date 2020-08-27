class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :artwork, :description, :likes, :user_id
  belongs_to :user
  has_many :comments
end
