class CreateComplitedTests < ActiveRecord::Migration[5.2]
  def change
    create_table :complited_tests do |t|
      t.integer :user_id
      t.integer :test_id
    end
  end
end
