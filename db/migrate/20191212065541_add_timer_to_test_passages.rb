class AddTimerToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :time_left, :datetime
  end
end
