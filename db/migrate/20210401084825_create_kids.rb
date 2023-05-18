class CreateKids < ActiveRecord::Migration[6.1]
  def change
    create_table :kids do |t|
      t.string :name
      t.integer :age
      t.string :current_standard
      t.string :school
      t.string :medium
      t.string :home_address
      t.string :mobile
      t.string :caste
      t.string :father_name
      t.string :father_occupation
      t.string :mother_name
      t.string :mother_occupation
      t.string :annual_income
      t.string :extra_curriculars
      t.string :personality_trait
      t.string :remarks
      t.references :house, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
