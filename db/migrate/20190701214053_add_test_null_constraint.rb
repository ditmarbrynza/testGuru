class AddTestNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:tests, :title, :level, false)
  end
end
