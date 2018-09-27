class Company < ApplicationRecord
  validates_presence_of :name
  validates :name, uniqueness: true
  validates :name, length: {in: 6..20}
end