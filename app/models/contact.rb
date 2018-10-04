class Contact < ApplicationRecord
  belongs_to :kind
  belongs_to :company
  has_one :address
  has_many :phones
  has_and_belongs_to_many :users

  def to_s
    self.name
  end
end
