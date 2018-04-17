class RemoveAvatarFromPost < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :avatar, :string
  end
end
