class RenameUserIdColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column(:gifs, :users_id, :user_id)
  end
end
