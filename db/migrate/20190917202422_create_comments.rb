class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
       t.text :message
      t.string :rating
      t.integer :user_id
      t.integer :coach_id
      t.timestamps
    end

    add_index :comments, [:user_id, :coach_id]
    add_index :comments, :coach_id
  end
end
