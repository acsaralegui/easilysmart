class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.string :title
      t.string :subtitle
      t.integer :section_id
      t.timestamps
    end
    add_index :chapters, :section_id
  end
end
