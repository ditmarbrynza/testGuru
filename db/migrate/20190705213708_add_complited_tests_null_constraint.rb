class AddComplitedTestsNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:complited_tests, :user_id, false)
    change_column_null(:complited_tests, :test_id, false)
  end
end
