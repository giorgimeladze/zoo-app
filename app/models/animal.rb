class Animal < ApplicationRecord
  belongs_to :user
  validates :specie, presence: true
  validates :age, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :color, presence: true
  validates :sex, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}

end
