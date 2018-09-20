class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :age
      t.boolean :active
      t.float :salary

      t.timestamps
    end
  end
end
