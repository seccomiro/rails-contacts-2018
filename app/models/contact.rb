class Contact < ApplicationRecord
  belongs_to :kind
  belongs_to :company

  def to_s
    self.name
  end
end
