class AddColumnTimestampsToComplitedTests < ActiveRecord::Migration[5.2]
  def change
    add_timestamps(:complited_tests, null: true)
  end
end
