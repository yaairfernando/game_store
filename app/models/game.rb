class Game < ApplicationRecord
  has_many :sales, foreign_key: :game_id, class_name: 'SaleConcept'
end
