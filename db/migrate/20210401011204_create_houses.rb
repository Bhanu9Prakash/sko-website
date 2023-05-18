class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.integer :house_number
      t.string :contact_number
      t.string :source_of_income
      t.integer :number_of_people_employed
      t.string :living_since
      t.string :average_income
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
