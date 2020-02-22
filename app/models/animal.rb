class Animal < ApplicationRecord
   validates :specie, presence: true
   validates :age, presence: true
   validates :color, presence: true
   validates :sex, presence: true
   validates :quantity, presence: true
end
