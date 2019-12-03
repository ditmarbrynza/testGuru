class AddForeignKeyTestsCategoryId < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :tests, :categories, on_delete: :cascade
  end
end
