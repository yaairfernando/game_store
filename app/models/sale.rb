class Sale < ApplicationRecord
  enum status: %i[done cancelled pending rejected authorized_rejected]
  belongs_to :buyer, class_name: 'Client'
  belongs_to :seller, class_name: 'User'
  belongs_to :sale_type, optional: true
  has_one :sale_detail, dependent: :destroy
  has_many :sale_concepts, dependent: :destroy

  scope :by_country, ->(country) do
    if country
      joins(:sale_detail).where('sale_details.country = ?', country)
    else
      all
    end
  end

  scope :by_sale_type, ->(sale_type) do
    if sale_type
      joins(:sale_type).where('sale_types.name = ?', sale_type)
    else
      all
    end
  end
end
