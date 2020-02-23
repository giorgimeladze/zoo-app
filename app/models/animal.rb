class Animal < ApplicationRecord
  belongs_to :user
  validates :specie, presence: true
  validates :age, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :color, presence: true
  validates :sex, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}

  def self.search_specie(text, user)
    text = text.downcase.strip
    user.animals.where("specie like ?", "%#{text}%").to_a
  end

  def self.search_color(text, user)
    text = text.downcase.strip
    user.animals.where("color like ?", "%#{text}%").to_a
  end

  def self.search_sex(text, user)
    text = text.downcase.strip
    user.animals.where("sex like ?", text).to_a
  end
end
