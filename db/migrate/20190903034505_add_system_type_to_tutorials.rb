class AddSystemTypeToTutorials < ActiveRecord::Migration[5.2]
  def change
    add_column :tutorials, :System_type, :string
  end
end
