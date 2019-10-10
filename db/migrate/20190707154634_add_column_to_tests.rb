class AddColumnToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :user_id, :integer
    add_foreign_key :tests, :user_id
    add_index :tests, :user_id
  end
end