class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.integer :subject_id
      t.string :year
      t.integer :question_no
      t.text :content
      t.text :options, array:true, default: []
      t.timestamps
    end
    add_index :questions, :year
    add_index :questions, :subject_id
    add_foreign_key :questions, :subjects, column: :subject_id
  end
end
