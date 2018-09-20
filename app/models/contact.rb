class Contact < ApplicationRecord
  belongs_to :kind

  def to_s
    self.name
  end
end
