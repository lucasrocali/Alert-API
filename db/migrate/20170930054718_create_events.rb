class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :location, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :importance
      t.string :comment

      t.timestamps
    end
  end
end
