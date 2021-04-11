class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.string :relation_with_head
      t.string :qualification
      t.belongs_to :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
