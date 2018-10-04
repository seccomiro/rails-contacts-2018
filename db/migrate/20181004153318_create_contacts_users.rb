class CreateContactsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts_users do |t|
      t.belongs_to :contact, foreign_key: true
      t.belongs_to :user, foreign_key: true
    end
  end
end
