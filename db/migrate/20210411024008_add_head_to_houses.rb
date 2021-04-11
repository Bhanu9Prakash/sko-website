class AddHeadToHouses < ActiveRecord::Migration[6.1]
  def change
    add_column :houses, :head, :string
  end
end
