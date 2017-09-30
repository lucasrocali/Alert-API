class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.references :api_user, foreign_key: true
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
