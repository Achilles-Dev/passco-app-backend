class CreateSubjectUserData < ActiveRecord::Migration[7.0]
  def change
    create_table :subject_user_data do |t|
      t.integer :subject_id
      t.integer :user_datum_id

      t.timestamps
    end
    add_index :subject_user_data, :subject_id
    add_index :subject_user_data, :user_datum_id
    add_foreign_key :subject_user_data, :subjects, column: :subject_id
    add_foreign_key :subject_user_data, :user_data, column: :user_datum_id
  end
end
