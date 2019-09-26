class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :tutorial_id
      t.timestamps
    end
    add_index :enrollments, [:user_id, :tutorial_id]
    add_index :enrollments, :tutorial_id
  end
end
