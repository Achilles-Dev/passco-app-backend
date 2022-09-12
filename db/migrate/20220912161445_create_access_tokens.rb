class CreateAccessTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :access_tokens do |t|
      t.integer :user_id
      t.string :token

      t.timestamps
    end
    add_index :access_tokens, :user_id
    add_foreign_key :access_tokens, :users, column: :user_id
  end
end
