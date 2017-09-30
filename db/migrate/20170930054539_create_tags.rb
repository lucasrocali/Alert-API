class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.references :api_user, foreign_key: true
      t.string :name
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
