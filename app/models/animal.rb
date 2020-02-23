class Animal < ApplicationRecord
  belongs_to :user
  validates :specie, presence: true
  validates :age, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :color, presence: true
  validates :sex, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}

  def self.search_specie(text)
    Animal.all
  end

  def self.search_color(text)

  end

  def self.search_sex(text)

  end
end
