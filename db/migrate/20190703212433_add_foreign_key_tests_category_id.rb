class AddForeignKeyTestsCategoryId < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key(:tests, :category_id)
  end
end
