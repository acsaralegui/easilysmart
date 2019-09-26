class AddVideoToChapters < ActiveRecord::Migration[5.2]
  def change
    add_column :chapters, :video, :string
  end
end
