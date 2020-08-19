  class User < ApplicationRecord
    has_many :post, dependent: :destroy
    has_many :comments, dependent: :destroy
  end
