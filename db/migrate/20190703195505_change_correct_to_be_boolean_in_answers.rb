class ChangeCorrectToBeBooleanInAnswers < ActiveRecord::Migration[5.2]
  def change
    change_column :answers, :correct, :boolean
  end
end
