class Client < ApplicationRecord
  has_many :purchases, class_name: "Sale", foreign_key: :buyer_id
end
