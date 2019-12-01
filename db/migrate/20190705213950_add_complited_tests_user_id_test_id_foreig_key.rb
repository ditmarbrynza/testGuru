class AddComplitedTestsUserIdTestIdForeigKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key(:complited_tests, :users)
    add_foreign_key(:complited_tests, :tests)
  end
end
