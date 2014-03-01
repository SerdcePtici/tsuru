class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :file
      t.integer :position
      t.references :picturable, polymorphic: true

      t.timestamps
    end
  end
end
