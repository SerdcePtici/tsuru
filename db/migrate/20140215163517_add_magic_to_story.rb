class AddMagicToStory < ActiveRecord::Migration
  def change
    add_column :stories, :magic, :boolean, default: false
  end
end
