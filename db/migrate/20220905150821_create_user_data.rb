class CreateUserData < ActiveRecord::Migration[7.0]
  def change
    create_table :user_data do |t|
      t.integer :user_id
      t.integer :score
      t.timestamps
    end
    add_index :user_data, :user_id
    add_foreign_key :user_data, :users, column: :user_id
  end
end
