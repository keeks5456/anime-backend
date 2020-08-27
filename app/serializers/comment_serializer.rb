class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :likes, :content
  belongs_to :post 
  belongs_to :user 

end
