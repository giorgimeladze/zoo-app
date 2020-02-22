class Animal < ApplicationRecord
   validates :specie, presence: true
   validates :age, presence: true
   validates :color, presence: true
   validates :sex, presence: true
   validates :quantity, presence: true
   validate  :correct_quantity

   private

   def correct_quantity
     unless quantity.is_a?(Integer) && quantity > 1
       errors.add(:quantity,"--> Positive Integer only")
     end
   end

   def correct_age
    unless age.is_a?(Integer) && age > 1
      errors.add(:age,"--> Positive Integer only. No other allowed.")
    end
  end
end
