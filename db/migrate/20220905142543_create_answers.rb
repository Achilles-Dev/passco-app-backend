class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.integer :subject_id
      t.integer :question_id
      t.string :value

      t.timestamps
    end
    add_index :answers, :question_id
    add_foreign_key :answers, :questions, column: :question_id
  end
end
