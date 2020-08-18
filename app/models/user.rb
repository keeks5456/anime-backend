  class User < ApplicationRecord
    has_many :post 
    has_many :comments, through: :post 
  end
