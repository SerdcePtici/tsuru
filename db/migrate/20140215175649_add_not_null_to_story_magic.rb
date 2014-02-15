class AddNotNullToStoryMagic < ActiveRecord::Migration
  def change
    change_column :stories, :magic, :boolean, null: false, default: false
  end
end
