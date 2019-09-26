class CreateCoaches < ActiveRecord::Migration[5.2]
  def change
    create_table :coaches do |t|
      t.string :name
      t.text :bio
      t.string :System_type
      t.text :description
      t.decimal :cost
      t.integer :user_id
      t.timestamps
    end
    add_index :coaches, :user_id
  end
end


