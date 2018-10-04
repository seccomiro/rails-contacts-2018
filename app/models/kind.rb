class Kind < ApplicationRecord
  def to_s
    self.description
  end

  has_many :contacts
end