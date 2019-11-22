class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.string :question
      t.string :url
      t.integer :user_id
      t.integer :question_id
      t.timestamps
    end
    add_index(:gists, :user_id)
    add_index(:gists, :question_id)
  end
end
