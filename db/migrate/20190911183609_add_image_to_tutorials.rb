class AddImageToTutorials < ActiveRecord::Migration[5.2]
  def change
    add_column :tutorials, :image, :string
  end
end
