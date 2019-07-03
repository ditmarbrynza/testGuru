class AddIndexToTestsCategoryId < ActiveRecord::Migration[5.2]
  def change
    add_index(:tests, :category_id)
  end
end
