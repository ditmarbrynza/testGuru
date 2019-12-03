class AddForeignKeyQuestionsTestId < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :questions, :tests, on_delete: :cascade
  end
end
