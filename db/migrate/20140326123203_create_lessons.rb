class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title

      t.timestamps
    end

    remove_column :albums, :lesson, :boolean
  end
end
