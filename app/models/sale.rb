class Sale < ApplicationRecord
  enum status: %i[done cancelled pending rejected authorized_rejected]
  belongs_to :buyer, class_name: 'Client'
  belongs_to :seller, class_name: 'User'
  belongs_to :sale_type, optional: true
  has_one :sale_detail, dependent: :destroy
  has_many :sale_concepts
end
