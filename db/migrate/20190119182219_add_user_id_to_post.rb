class AddUserIdToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :userId, :integer
  end
end
