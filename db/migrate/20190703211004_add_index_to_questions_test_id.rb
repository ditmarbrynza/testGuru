class AddIndexToQuestionsTestId < ActiveRecord::Migration[5.2]
  def change
    add_index(:questions, :test_id)
  end
end
