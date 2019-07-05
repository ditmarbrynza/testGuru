class AddComplitedTestsUserIdTestIdForeigKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key(:complited_tests, :user_id)
    add_foreign_key(:complited_tests, :test_id)
  end
end
