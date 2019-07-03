class AddForeignKeyQuestionsTestId < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key(:questions, :test_id)
  end
end
