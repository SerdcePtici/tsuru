class AddLessonToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :lesson, :boolean
  end
end
