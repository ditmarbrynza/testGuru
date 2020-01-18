class AddStatusAndTryColumnsToCompletedTests < ActiveRecord::Migration[5.2]
  def change
    add_column :completed_tests, :status, :boolean, default: 0
    add_column :completed_tests, :try, :integer, default: 1
  end
end
