class AddComplitedTestsUserIdTestIdIndex < ActiveRecord::Migration[5.2]
  def change
    add_index(:complited_tests, :user_id)
    add_index(:complited_tests, :test_id)
  end
end
