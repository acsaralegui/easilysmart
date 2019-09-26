class CreateTutorials < ActiveRecord::Migration[5.2]
  def change
    create_table :tutorials do |t|
      t.string :title
      #t.string :System_type
      t.text :description
      t.decimal :cost
      t.integer :user_id
      t.timestamps
    end
    add_index :tutorials, :user_id
  end
end
