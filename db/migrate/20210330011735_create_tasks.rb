class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :description
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
