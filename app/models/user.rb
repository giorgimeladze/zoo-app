class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :animals

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end

  def full_name
    return "#{first_name} #{last_name}" if first_name || last_name
    "Zoo Keeper"
  end
end
