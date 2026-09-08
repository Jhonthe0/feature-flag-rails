class User < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable

  validates :name, presence: true
end
