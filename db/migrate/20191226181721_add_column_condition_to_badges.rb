class AddColumnConditionToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :condition, :json, default: {}
  end
end
