class User < ApplicationRecord
  has_many :sales, foreign_key: :seller_id
end
