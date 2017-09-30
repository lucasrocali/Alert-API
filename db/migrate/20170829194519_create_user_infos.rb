class CreateUserInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :user_infos do |t|
      t.references :user, foreign_key: true
      t.string :name

      t.timestamps
    end

    #add_index :user_infos, :user,  unique: true
  end
end
