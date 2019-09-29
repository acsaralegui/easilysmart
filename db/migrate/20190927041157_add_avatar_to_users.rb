class AddAvatarToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :user, :avatar, :string
  end
end
