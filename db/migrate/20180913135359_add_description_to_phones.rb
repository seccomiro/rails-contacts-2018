class AddDescriptionToPhones < ActiveRecord::Migration[5.2]
  def change
    add_column :phones, :description, :string
    add_column :phones, :main, :boolean
  end
end
