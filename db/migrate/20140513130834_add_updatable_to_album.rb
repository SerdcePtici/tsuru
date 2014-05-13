class AddUpdatableToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :updatable, :boolean, default: true
  end
end
