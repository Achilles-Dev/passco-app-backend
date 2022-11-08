class AddYearToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :year, :string
  end
end
