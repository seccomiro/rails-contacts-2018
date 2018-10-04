class Company < ApplicationRecord
  validates_presence_of :name
  validates :name, uniqueness: true
  validates :name, length: {in: 6..200}

  has_many :contacts
  has_many :phones, through: :contacts
  has_many :addresses, through: :contacts
end