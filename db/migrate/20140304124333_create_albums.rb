class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.references :topic, index: true

      t.timestamps
    end
  end
end
