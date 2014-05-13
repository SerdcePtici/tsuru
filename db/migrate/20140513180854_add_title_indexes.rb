class AddTitleIndexes < ActiveRecord::Migration
  def change
    add_index :stories, %i[title magic]
    add_index :lessons, :title
    add_index :topics, :title
    add_index :albums, %i[title topic_id]
  end
end
