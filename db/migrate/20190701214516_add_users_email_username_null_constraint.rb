class AddUsersEmailUsernameNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:users, :email, :username, false)
  end
end
