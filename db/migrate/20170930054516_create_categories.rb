class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.references :api_user, foreign_key: true
      t.string :name
      t.string :image_url
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
